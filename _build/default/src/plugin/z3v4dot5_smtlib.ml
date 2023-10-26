module Z = Prover.Z3v4dot5_prover
module Zn = Z3native
module Sp = Prover.Smtlib_prover
module P = Prover.Prover_api
module C = Prover.Combine_provers

let _ =
  Verifier.Verifast.register_prover "Z3v4.5+SMTLib"
    "(experimental) run Z3 version 4.5 and dump the session to a file in SMTLib format."
    (
      fun client ->
      let z3_ctxt =
        (new Z.z3_context():
           Z.z3_context :> (Zn.sort, Zn.func_decl, Zn.ast) P.context)
      in
      let smtlib_ctxt =
        Sp.dump_smtlib_ctxt
          "z3_v4dot5_dump.smt2"
          ["dump"; "I"; "Q"; "NDT"; "LIA"; "LRA"]
      in
      client#run (C.combine z3_ctxt smtlib_ctxt C.Sync)
    )
