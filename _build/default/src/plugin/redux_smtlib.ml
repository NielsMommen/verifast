module R = Prover.Redux
module Sp = Prover.Smtlib_prover
module P = Prover.Prover_api
module C = Prover.Combine_provers

let _ =
  Verifier.Verifast.register_prover "Redux+SMTLib"
    "(experimental) run Redux and dump the session to a file in SMTLib format."
    (
      fun client ->
      let redux_ctxt =
        (new R.context ():
           R.context :> (unit, R.symbol, (R.symbol, R.termnode) R.term) P.context)
      in
      let smtlib_ctxt =
        Sp.dump_smtlib_ctxt
          "redux_dump.smt2"
          ["dump"; "I"; "Q"; "NDT"; "LIA"; "LRA"]
      in
      client#run (C.combine redux_ctxt smtlib_ctxt C.Sync)
    )
