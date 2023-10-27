val unsupported_exception : bool ref

val emit : ?margin:int -> string -> Frontend.Ast.package list -> unit


(*
  Made public for testing purposes
*)
val sexpr_of_type_ : Frontend.Ast.type_ -> Expr.sexpression

val sexpr_of_type_expr : Frontend.Ast.type_expr -> Expr.sexpression

val sexpr_of_decl : Frontend.Ast.decl -> Expr.sexpression

val sexpr_of_package : Frontend.Ast.package -> Expr.sexpression

val sexpr_of_expr : Frontend.Ast.expr -> Expr.sexpression
