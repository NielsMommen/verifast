val unsupported_exception : bool ref

val emit : ?margin:int -> string -> Ast.package list -> unit


(*
  Made public for testing purposes
*)
val sexpr_of_type_ : Ast.type_ -> Sexpressions.sexpression

val sexpr_of_type_expr : Ast.type_expr -> Sexpressions.sexpression

val sexpr_of_decl : Ast.decl -> Sexpressions.sexpression

val sexpr_of_package : Ast.package -> Sexpressions.sexpression

val sexpr_of_expr : Ast.expr -> Sexpressions.sexpression
