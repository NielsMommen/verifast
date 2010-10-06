#include "ghost_lists.h"
#include "raw_ghost_lists.h"

/*@

fixpoint bool forall<t>(list<t> xs, fixpoint(t, bool) p) {
    switch (xs) {
        case nil: return true;
        case cons(h, t): return p(h) && forall(t, p);
    }
}
lemma void forall_append<t>(list<t> xs, list<t> ys, fixpoint(t, bool) p)
    requires true;
    ensures forall(append(xs, ys), p) == (forall(xs, p) && forall(ys, p));
{
    switch (xs) {
        case nil:
        case cons(h, t):
            forall_append(t, ys, p);
    }
}

    switch (xs) {
        case nil: return 0;
        case cons(h, t): return (h == x ? 1 : 0) + count(x, t);
    }
}

lemma void count_append<t>(t x, list<t> xs, list<t> ys)
    requires true;
    ensures count(x, append(xs, ys)) == count(x, xs) + count(x, ys);
{
    switch (xs) {
        case nil:
        case cons(h, t):
            count_append(x, t, ys);
    }
}

fixpoint bool count_le<t>(unit u, list<t> xs, list<t> ys, t x) {
    switch (u) {
        case unit: return count(x, xs) <= count(x, ys);
    }
}

predicate ghost_list<t>(int id, list<t> xs) =
    raw_ghost_list_member_handle<t>(id, _, x);
lemma int create_ghost_list<t>()
    requires true;
    ensures ghost_list<t>(result, nil);
}