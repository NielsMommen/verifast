let _ =
  Verifier.Verifast.register_prover "Redux"
    "the built-in Redux theorem prover. A partial re-implementation in OCaml by the VeriFast team of the Simplify theorem prover [Detlefs, Nelson, and Saxe]."
    (
      fun client ->
        let ctxt = (new Prover.Redux.context (): Prover.Redux.context :> (unit, Prover.Redux.symbol, (Prover.Redux.symbol, Prover.Redux.termnode) Prover.Redux.term) Prover.Prover_api.context) in
        client#run ctxt
    )
