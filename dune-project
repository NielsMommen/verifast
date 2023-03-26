(lang dune 3.7)

(generate_opam_files false)

(license MIT)

(package
 (name verifast)
 (synopsis "Tool for modular formal verification.")
 (description
  "VeriFast is a research prototype of a tool for modular formal verification of correctness properties of single-threaded and multithreaded C and Java programs annotated with preconditions and postconditions written in separation logic. To express rich specifications, the programmer can define inductive datatypes, primitive recursive pure functions over these datatypes, and abstract separation logic predicates. To verify these rich specifications, the programmer can write lemma functions, i.e., functions that serve only as proofs that their precondition implies their postcondition. The verifier checks that lemma functions terminate and do not have side-effects. Since neither VeriFast itself nor the underlying SMT solver need to do any significant search, verification time is predictable and low.")
 (depends
  camlp-streams
  (num
   (= 1.4))
  z3))
