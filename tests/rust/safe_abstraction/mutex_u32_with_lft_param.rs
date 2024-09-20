#![feature(negative_impls)]
#![allow(dead_code)]

/*
About the definitions:
    Since to have `MutexU32::lock` verified we need to return the `[qa]lifetime_token(a)` back, we need to close the `frac_borrow` before the method ends.
    To close that `frac_borrow` we need the `SysMutex_share` fraction used to lock the `sys::locks::Mutex` back.
    That means the spec of `sys::locks::Mutex::lock` must return the `SysMutex_share` fraction it receives.
    The latter means neither to have a full chunk of `SysMutex_share` nor a full chunk of `SysMutex` means the mutex is unlocked.
    However, it does not make any problem, because if destroying a locked mutex is an undefined behaviour the implementation of `sys::locks::Mutex::drop`
    just forgets about the mutex.
*/

/*@

pred SysMutex(m: sys::locks::Mutex; P: pred());
pred SysMutex_share(l: *sys::locks::Mutex; P: pred());
pred sys::locks::Mutex_own(t: thread_id_t, m: sys::locks::Mutex);

lem SysMutex_to_own(t: thread_id_t, m: sys::locks::Mutex);
    req SysMutex(m, _);
    ens sys::locks::Mutex_own(t, m);

lem SysMutex_share_full(l: *sys::locks::Mutex);
    req *l |-> ?m &*& SysMutex(m, ?P);
    ens SysMutex_share(l, P);
lem SysMutex_end_share(l: *sys::locks::Mutex);
   req SysMutex_share(l, ?P);
   ens *l |-> ?m &*& SysMutex(m, P);

pred SysMutex_locked(l: *sys::locks::Mutex, P: pred(); t: thread_id_t);

lem SysMutex_renew(m: sys::locks::Mutex, Q: pred());
    req SysMutex(m, ?P) &*& Q();
    ens SysMutex(m, Q);

/* Justifying the soundness of `SysMutex_renew`:
As mentioned above, with this specification for `sys::locks::Mutex` interface having a full chunk of `SysMutex` or `SysMutex_share`
does not necessarily mean the mutex is not locked. If it was the case the lemma's soundness was easier to justify.
We get `SysMutex(m, ?P)` in the `req` clause so there is not any fraction of `SysMutex(m, P)` or `SysMutex_share(lm, P)` anywhere else.
After applying the lemma the soundness of `sys::locks::Mutex` interface is justified since if:
- The mutex is unlocked and the resource `P()` is protected by mutex; It is in the mutex so to speak. We substitute `P` with `Q`
    and from this point, there will be no `SysMutex`, `SysMutex_share` or `SysMutex_locked` chunk that mentions `P` anywhere.
    It means we leak `P()` and the state is just like after a call to `sys::locks::Mutex::new` to protect `Q()`.

- The mutex is locked, it means there should be a `SysMutex_locked(lm, P, ?t)` and `P()` in resources of some thread(s).
    - `lock` gets verified which is fine because this call never returns. No other thread has `[?q]SysMutex_share(lm, P)`
        to release the mutex.
    - `unlock` cannot get verified with chunks mentioning `P` as there is no `[?q]SysMutex_share(lm, P)` anywhere and verification with
        `SysMutex_locked(lm, Q, ?t)` does not represent a real execution as `lock` never returns.
    - `drop` will get verified and it is sound because `sys::locks::Mutex` implementation of `Drop` does not destroy a locked mutex, but
        simply leaks it. Here `Q()` gets leaked too.
*/

lem SysMutex_share_implies(l: *sys::locks::Mutex, P: pred(), P1: pred());
    req SysMutex_share(l, P) &*& is_implies(?f, P, P1) &*& is_implies(?f1, P1, P);
    ens SysMutex_share(l, P1) &*& is_implies(f, P, P1) &*& is_implies(f1, P1, P);

@*/

mod sys {
    pub mod locks {
        use std::process::abort;
        pub struct Mutex {
            m: *mut u32,
        }

        impl Mutex {
            pub unsafe fn new() -> Mutex
            //@ req exists::<pred()>(?P) &*& P();
            //@ ens SysMutex(result, P);
            {
                abort();
            }

            // TODO: Use `current_thread` var in `SysMutex_locked` like in the `threading.h`. The `SysMutex` interface does not need `thread_token` in the contracts.
            pub unsafe fn lock<'a>(&'a self)
            //@ req thread_token(?t) &*& [?q]SysMutex_share(self, ?P);
            //@ ens thread_token(t) &*& [q]SysMutex_share(self, P) &*& SysMutex_locked(self, P, t) &*& P();
            {
                abort();
            }

            pub unsafe fn unlock<'a>(&'a self)
            //@ req thread_token(?t) &*& SysMutex_locked(self, ?P, t) &*& P() &*& [?q]SysMutex_share(self, P);
            //@ ens thread_token(t) &*& [q]SysMutex_share(self, P);
            {
                abort();
            }

            // TODO: impl Drop for Mutex
            unsafe fn drop<'a>(&'a mut self)
            //@ req (*self) |-> ?m &*& SysMutex(m, _);
            //@ ens (*self) |-> m;
            {
                abort();
            }
        }
    }
}

use std::{
    cell::UnsafeCell,
    ops::{Deref, DerefMut},
};

pub struct MutexU32 {
    inner: sys::locks::Mutex,
    data: UnsafeCell<u32>,
}

/*@

pred True(;) = true;
pred <MutexU32>.own(t, mutexU32) = SysMutex(mutexU32.inner, True);

lem MutexU32_drop()
    req MutexU32_own(?t, ?mutexU32);
    ens sys::locks::Mutex_own(t, mutexU32.inner);
{
    open MutexU32_own(t, mutexU32);
    SysMutex_to_own(t, mutexU32.inner);
}

pred_ctor MutexU32_fbc_inner(l: *MutexU32)(;) = (*l).inner |-> ?inner &*& SysMutex(inner, True) &*& struct_MutexU32_padding(l);

fix t0() -> thread_id_t { default_value }

pred_ctor MutexU32_frac_borrow_content(kfcc: lifetime_t, l: *MutexU32)(;) =
    SysMutex_share(&(*l).inner, full_borrow_(kfcc, u32_full_borrow_content(t0, &(*l).data))) &*& struct_MutexU32_padding(l);

pred <MutexU32>.share(k, t, l) =
    exists_np(?kfcc) &*& lifetime_inclusion(k, kfcc) == true &*& frac_borrow(k, MutexU32_frac_borrow_content(kfcc, l));

lem MutexU32_share_mono(k: lifetime_t, k1: lifetime_t, t: thread_id_t, l: *MutexU32)
    req lifetime_inclusion(k1, k) == true &*& [_]MutexU32_share(k, t, l);
    ens [_]MutexU32_share(k1, t, l);
{
    open MutexU32_share(k, t, l); assert [_]exists_np(?kfcc);
    frac_borrow_mono(k, k1, MutexU32_frac_borrow_content(kfcc, l));
    assert [?q]frac_borrow(k1, _); close [q]exists_np(kfcc);
    // TODO: Why does VeriFast not just close using any dummy fraction when it is trying to close a dummy fraction?
    lifetime_inclusion_trans(k1, k, kfcc);
    close [q]MutexU32_share(k1, t, l);
}

lem MutexU32_share_full(k: lifetime_t, t: thread_id_t, l: *MutexU32)
    req atomic_mask(Nlft) &*& full_borrow(k, MutexU32_full_borrow_content(t, l)) &*& [?q]lifetime_token(k);
    ens atomic_mask(Nlft) &*& [_]MutexU32_share(k, t, l) &*& [q]lifetime_token(k);
{

    produce_lem_ptr_chunk implies(sep(MutexU32_fbc_inner(l), u32_full_borrow_content(t0, &(*l).data)), MutexU32_full_borrow_content(t, l))() {
        open sep(MutexU32_fbc_inner(l), u32_full_borrow_content(t0, &(*l).data))();
        open MutexU32_fbc_inner(l)();
        open u32_full_borrow_content(t0, &(*l).data)();
        assert (*l).inner |-> ?inner &*& (*l).data |-> ?data;
        close MutexU32_own(t, MutexU32 { inner, data });
        close MutexU32_full_borrow_content(t, l)();
    }{
        produce_lem_ptr_chunk implies(MutexU32_full_borrow_content(t, l), sep(MutexU32_fbc_inner(l), u32_full_borrow_content(t0, &(*l).data)))() {
            open MutexU32_full_borrow_content(t, l)();
            assert (*l).inner |-> ?inner &*& (*l).data |-> ?data;
            open MutexU32_own(t, MutexU32 { inner, data });
            close MutexU32_fbc_inner(l)();
            close u32_full_borrow_content(t0, &(*l).data)();
            close sep(MutexU32_fbc_inner(l), u32_full_borrow_content(t0, &(*l).data))();
        }{
            full_borrow_implies(k, MutexU32_full_borrow_content(t, l), sep(MutexU32_fbc_inner(l), u32_full_borrow_content(t0, &(*l).data)));
        }
        full_borrow_split_m(k, MutexU32_fbc_inner(l), u32_full_borrow_content(t0, &(*l).data));
        let kstrong = open_full_borrow_strong_m(k, MutexU32_fbc_inner(l), q);
        produce_lem_ptr_chunk full_borrow_convert_strong(True, MutexU32_frac_borrow_content(k, l), kstrong, MutexU32_fbc_inner(l))() {
            open MutexU32_frac_borrow_content(k, l)();
            SysMutex_end_share(&(*l).inner);
            assert (*l).inner |-> ?inner;
            SysMutex_renew(inner, True);
            close MutexU32_fbc_inner(l)();
        }{
            open MutexU32_fbc_inner(l)();
            assert (*l).inner |-> ?inner;
            close full_borrow_(k, u32_full_borrow_content(t0, &(*l).data))();
            SysMutex_renew(inner, full_borrow_(k, u32_full_borrow_content(t0, &(*l).data)));
            SysMutex_share_full(&(*l).inner);
            close MutexU32_frac_borrow_content(k, l)();
            close_full_borrow_strong_m(kstrong, MutexU32_fbc_inner(l), MutexU32_frac_borrow_content(k, l));
            full_borrow_into_frac_m(kstrong, MutexU32_frac_borrow_content(k, l));
            frac_borrow_mono(kstrong, k, MutexU32_frac_borrow_content(k, l));
            open exists(kstrong); assert [?qfb]frac_borrow(k, MutexU32_frac_borrow_content(k, l));
            close [qfb]exists_np(k);
            lifetime_inclusion_refl(k);
            close [qfb]MutexU32_share(k, t, l);
        }
    }
}

@*/

unsafe impl Send for MutexU32 {}

/*@

lem MutexU32_send(t: thread_id_t, t1: thread_id_t)
    req MutexU32_own(t, ?mutexU32);
    ens MutexU32_own(t1, mutexU32);
{
    open MutexU32_own(t, mutexU32);
    close MutexU32_own(t1, mutexU32);
}

@*/

unsafe impl Sync for MutexU32 {}

/*@

lem MutexU32_sync(t: thread_id_t, t1: thread_id_t)
    req MutexU32_share(?k, t, ?l);
    ens MutexU32_share(k, t1, l);
{
    open MutexU32_share(k, t, l);
    close MutexU32_share(k, t1, l);
}

@*/

pub struct MutexGuardU32<'a> {
    lock: &'a MutexU32,
}

/*@

// TODO: Is this extra lifetime `klong` necessary here?
pred_ctor MutexGuardU32_own<'a>()(t: thread_id_t, mutexGuardU32: MutexGuardU32<'a>) =
    [_]exists_np(?klong) &*& lifetime_inclusion('a, klong) == true &*& [_]frac_borrow('a, MutexU32_frac_borrow_content(klong, mutexGuardU32.lock))
    &*& SysMutex_locked(&(*mutexGuardU32.lock).inner, full_borrow_(klong, u32_full_borrow_content(t0, &(*mutexGuardU32.lock).data)), t)
    &*& full_borrow(klong, u32_full_borrow_content(t0, &(*mutexGuardU32.lock).data));

pred_ctor MutexGuardU32_fbc_rest<'a>(klong: lifetime_t, t: thread_id_t, l: *MutexGuardU32<'a>, lock: *MutexU32)() =
    (*l).lock |-> lock &*& lifetime_inclusion('a, klong) == true &*& struct_MutexGuardU32_padding(l)
    &*& [_]frac_borrow('a, MutexU32_frac_borrow_content(klong, lock))
    &*& SysMutex_locked(&(*lock).inner, full_borrow_(klong, u32_full_borrow_content(t0, &(*lock).data)), t);

pred_ctor MutexGuardU32_share<'a>()(k: lifetime_t, t: thread_id_t, l: *MutexGuardU32<'a>) = true;

lem MutexGuardU32_share_mono<'a>(k: lifetime_t, k1: lifetime_t, t: thread_id_t, l: *MutexGuardU32<'a>)
    req lifetime_inclusion(k1, k) == true &*& [_]MutexGuardU32_share::<'a>(k, t, l);
    ens [_]MutexGuardU32_share::<'a>(k1, t, l);
{
    close MutexGuardU32_share::<'a>(k1, t, l);
    leak MutexGuardU32_share::<'a>(k1, t, l);
}

lem MutexGuardU32_share_full<'a>(k: lifetime_t, t: thread_id_t, l: *MutexGuardU32<'a>)
    req full_borrow(k, MutexGuardU32_full_borrow_content::<'a>(t, l)) &*& [?q]lifetime_token(k);
    ens [_]MutexGuardU32_share::<'a>(k, t, l) &*& [q]lifetime_token(k);
{
    leak full_borrow(_, _);
    close MutexGuardU32_share::<'a>(k, t, l);
    leak MutexGuardU32_share::<'a>(k, t, l);
}

@*/

impl<'a> !Send for MutexGuardU32<'a> {}

unsafe impl<'a> Sync for MutexGuardU32<'a> {}

/*@

lem MutexGuardU32_sync<'a>(t: thread_id_t, t1: thread_id_t)
    req MutexGuardU32_share::<'a>(?k, t, ?l);
    ens MutexGuardU32_share::<'a>(k, t1, l);
{
    open MutexGuardU32_share::<'a>(k, t, l);
    close MutexGuardU32_share::<'a>(k, t1, l);
}

@*/

impl MutexU32 {
    pub fn new(v: u32) -> MutexU32 {
        //@ close exists::<pred()>(True);
        let inner = unsafe { sys::locks::Mutex::new() };
        let data = UnsafeCell::new(v);
        let r = MutexU32 { inner, data };
        //@ close MutexU32_own(_t, r);
        r
    }

    /*
    https://doc.rust-lang.org/std/sync/struct.Mutex.html#method.lock
    "The exact behavior on locking a mutex in the thread which already holds the lock is left unspecified.
    However, this function will not return on the second call (it might panic or deadlock, for example)."
    Note that in either case it is not undefined behaviour.
    */
    pub fn lock<'a>(&'a self) -> MutexGuardU32<'a>
    //@ req thread_token(?t) &*& [?qa]lifetime_token('a) &*& [_]MutexU32_share('a, t, self);
    //@ ens thread_token(t) &*& [qa]lifetime_token('a) &*& MutexGuardU32_own::<'a>(t, result);
    {
        unsafe {
            //@ open MutexU32_share('a, t, self);
            //@ assert [_]exists_np(?klong);
            //@ open_frac_borrow('a, MutexU32_frac_borrow_content(klong, self), qa);
            //@ open MutexU32_frac_borrow_content(klong, self)();
            self.inner.lock();
            //@ assert [?qp]SysMutex_share(&(*self).inner, _);
            //@ close [qp]MutexU32_frac_borrow_content(klong, self)();
            //@ close_frac_borrow(qp, MutexU32_frac_borrow_content(klong, self));
            //@ close MutexGuardU32_own::<'a>(t, MutexGuardU32::<'a> { lock: self });
            MutexGuardU32 { lock: self }
        }
    }
}

impl<'b> MutexGuardU32<'b> {

    // TODO: deref_mut should be in the implementation of the trait `DerefMut`. Support for the implementation for standard library traits is
    // needed for that.
    pub fn deref_mut<'a>(self: &'a mut MutexGuardU32<'b>) -> &'a mut u32 where 'b: 'a
    /*@
    req
        thread_token(?t) &*& [?qa]lifetime_token('a) &*& [?qb]lifetime_token('b)
        &*& full_borrow('a, MutexGuardU32_full_borrow_content::<'b>(t, self))
        &*& lifetime_inclusion('a, 'b) == true;
    @*/
    //@ ens thread_token(t) &*& [qa]lifetime_token('a) &*& [qb]lifetime_token('b) &*& full_borrow('a, u32_full_borrow_content(t, result));
    {
        //@ let kstrong = open_full_borrow_strong('a, MutexGuardU32_full_borrow_content::<'b>(t, self), qa/2);
        //@ open MutexGuardU32_full_borrow_content::<'b>(t, self)();
        //@ open MutexGuardU32_own::<'b>(t, ?mutexGuardU32);
        //@ let lock = mutexGuardU32.lock;

        // We need `(*lock).data |-> _` to get ptr provenance info
        //@ assert [_]exists_np(?kmlong);
        //@ lifetime_inclusion_trans('a, 'b, kmlong);
        //@ lifetime_token_trade('a, qa/2, kmlong);
        //@ assert [?qkml]lifetime_token(kmlong);
        //@ open_full_borrow(qkml, kmlong, u32_full_borrow_content(t0, &(*lock).data));
        //@ open u32_full_borrow_content(t0, &(*lock).data)();
        //@ points_to_limits(&(*lock).data);
        //@ close u32_full_borrow_content(t0, &(*lock).data)();
        //@ close_full_borrow(u32_full_borrow_content(t0, &(*lock).data));
        //@ lifetime_token_trade_back(qkml, kmlong);
        let r = unsafe { &mut *(*self.lock).data.get() };
        /*@
        produce_lem_ptr_chunk full_borrow_convert_strong(True,
            sep(MutexGuardU32_fbc_rest::<'b>(kmlong, t, self, lock), full_borrow_(kmlong, u32_full_borrow_content(t0, &(*lock).data))),
            kstrong,
            MutexGuardU32_full_borrow_content::<'b>(t, self))() {
                open sep(MutexGuardU32_fbc_rest::<'b>(kmlong, t, self, lock), full_borrow_(kmlong, u32_full_borrow_content(t0, &(*lock).data)))();
                open MutexGuardU32_fbc_rest::<'b>(kmlong, t, self, lock)();
                open full_borrow_(kmlong, u32_full_borrow_content(t0, &(*lock).data))();
                close exists_np(kmlong); leak exists_np(kmlong);
                close MutexGuardU32_own::<'b>(t, mutexGuardU32);
                close MutexGuardU32_full_borrow_content::<'b>(t, self)();
            }{
                close MutexGuardU32_fbc_rest::<'b>(kmlong, t, self, lock)();
                close full_borrow_(kmlong, u32_full_borrow_content(t0, &(*lock).data))();
                close sep(MutexGuardU32_fbc_rest::<'b>(kmlong, t, self, lock), full_borrow_(kmlong, u32_full_borrow_content(t0, &(*lock).data)))();
                close_full_borrow_strong(kstrong, MutexGuardU32_full_borrow_content::<'b>(t, self),
                    sep(MutexGuardU32_fbc_rest::<'b>(kmlong, t, self, lock), full_borrow_(kmlong, u32_full_borrow_content(t0, &(*lock).data))));
                full_borrow_split(kstrong, MutexGuardU32_fbc_rest::<'b>(kmlong, t, self, lock),
                    full_borrow_(kmlong, u32_full_borrow_content(t0, &(*lock).data)));
                full_borrow_unnest(kstrong, kmlong, u32_full_borrow_content(t0, &(*lock).data));
                lifetime_inclusion_glb('a, kstrong, kmlong);
                full_borrow_mono(lifetime_intersection(kstrong, kmlong), 'a, u32_full_borrow_content(t0, &(*lock).data));
            }
        @*/
        //@ leak full_borrow(kstrong, _);
        /*@
        produce_lem_ptr_chunk implies(u32_full_borrow_content(t0, &(*lock).data), u32_full_borrow_content(t, &(*lock).data))() {
            open u32_full_borrow_content(t0, &(*lock).data)();
            close u32_full_borrow_content(t, &(*lock).data)();
        } {
            produce_lem_ptr_chunk implies(u32_full_borrow_content(t, &(*lock).data), u32_full_borrow_content(t0, &(*lock).data))() {
                open u32_full_borrow_content(t, &(*lock).data)();
                close u32_full_borrow_content(t0, &(*lock).data)();
            } {
                full_borrow_implies('a, u32_full_borrow_content(t0, &(*lock).data), u32_full_borrow_content(t, &(*lock).data));
            }
        }
        @*/
        r
    }

}

impl<'a> Drop for MutexGuardU32<'a> {

    fn drop<'b>(self: &'b mut MutexGuardU32<'a>)
    //@ req thread_token(?t) &*& [?qkm]lifetime_token('a) &*& MutexGuardU32_full_borrow_content::<'a>(t, self)();
    //@ ens thread_token(t) &*& [qkm]lifetime_token('a) &*& (*self).lock |-> ?lock &*& [_]MutexU32_share('a, t, lock) &*& struct_MutexGuardU32_padding(self);
    {
        //@ open MutexGuardU32_full_borrow_content::<'a>(t, self)();
        //@ open MutexGuardU32_own::<'a>(t, ?mutexGuardU32);
        //@ let lock = mutexGuardU32.lock;
        //@ open [_]exists_np(?kmlong);
        //@ open_frac_borrow('a, MutexU32_frac_borrow_content(kmlong, lock), qkm);
        //@ open MutexU32_frac_borrow_content(kmlong, lock)();
        unsafe {
            (*self.lock).inner.unlock();
        }
        //@ assert [?qp]SysMutex_share(&(*lock).inner, _);
        //@ close_frac_borrow(qp, MutexU32_frac_borrow_content(kmlong, lock));
        //@ assert [?qfrac]frac_borrow('a, _);
        //@ close [qfrac]exists_np(kmlong);
        //@ close [qfrac]MutexU32_share('a, t, lock);
    }

}