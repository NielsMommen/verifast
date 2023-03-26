[@@@ocaml.warning "-27-32-37-60"]

type ro = Capnp.Message.ro
type rw = Capnp.Message.rw

module type S = sig
  module MessageWrapper : Capnp.RPC.S
  type 'cap message_t = 'cap MessageWrapper.Message.t
  type 'a reader_t = 'a MessageWrapper.StructStorage.reader_t
  type 'a builder_t = 'a MessageWrapper.StructStorage.builder_t

  module NbBase_15750048951651279863 : sig
    type t =
      | Decimal
      | Octal
      | Hex
      | Undefined of int
  end
  module SufKind_10349718269051794478 : sig
    type t =
      | LSuf
      | LLSuf
      | NoSuf
      | Undefined of int
  end
  module BinaryOpKind_15775553773985184773 : sig
    type t =
      | Add
      | Sub
      | Assign
      | Mul
      | Div
      | Rem
      | Shl
      | Shr
      | Lt
      | Gt
      | Le
      | Ge
      | Eq
      | Ne
      | And
      | Or
      | Xor
      | LAnd
      | LOr
      | MulAssign
      | DivAssign
      | RemAssign
      | AddAssign
      | SubAssign
      | ShlAssign
      | ShrAssign
      | AndAssign
      | XorAssign
      | OrAssign
      | Undefined of int
  end
  module UnaryOpKind_16270584510146119878 : sig
    type t =
      | Plus
      | Minus
      | Not
      | LNot
      | AddrOf
      | Deref
      | PreInc
      | PreDec
      | PostInc
      | PostDec
      | Undefined of int
  end
  module InitStyle_13739150215916644662 : sig
    type t =
      | CopyInit
      | ListInit
      | Undefined of int
  end
  module InitStyle_15285372864656172726 : sig
    type t =
      | CInit
      | CallInit
      | ListInit
      | Undefined of int
  end
  module FixedWidthKind_14562236601123920723 : sig
    type t =
      | Int
      | UInt
      | Undefined of int
  end
  module BuiltinKind_11913544707969661485 : sig
    type t =
      | Char
      | UChar
      | Short
      | UShort
      | Void
      | Bool
      | Int
      | UInt
      | Long
      | ULong
      | LongLong
      | ULongLong
      | Undefined of int
  end
  module RecordKind_12907431634679073908 : sig
    type t =
      | Struc
      | Class
      | Unio
      | Undefined of int
  end

  module Reader : sig
    type array_t
    type builder_array_t
    type pointer_t = ro MessageWrapper.Slice.t option
    val of_pointer : pointer_t -> 'a reader_t
    module Loc : sig
      type struct_t = [`Loc_b1436df23fb200b4]
      type t = struct_t reader_t
      module SrcPos : sig
        type struct_t = [`SrcPos_80bc3ef5a3c049a0]
        type t = struct_t reader_t
        val l_get : t -> int
        val c_get : t -> int
        val fd_get : t -> int
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      val has_start : t -> bool
      val start_get : t -> [`SrcPos_80bc3ef5a3c049a0] reader_t
      val start_get_pipelined : struct_t MessageWrapper.StructRef.t -> [`SrcPos_80bc3ef5a3c049a0] MessageWrapper.StructRef.t
      val has_end : t -> bool
      val end_get : t -> [`SrcPos_80bc3ef5a3c049a0] reader_t
      val end_get_pipelined : struct_t MessageWrapper.StructRef.t -> [`SrcPos_80bc3ef5a3c049a0] MessageWrapper.StructRef.t
      val of_message : 'cap message_t -> t
      val of_builder : struct_t builder_t -> t
    end
    module Node : sig
      type struct_t = [`Node_e2a8b78aa50d684a]
      type t = struct_t reader_t
      val has_loc : t -> bool
      val loc_get : t -> Loc.t
      val loc_get_pipelined : struct_t MessageWrapper.StructRef.t -> Loc.struct_t MessageWrapper.StructRef.t
      val desc_get : t -> pointer_t
      val desc_get_interface : t -> 'a MessageWrapper.Capability.t option
      val of_message : 'cap message_t -> t
      val of_builder : struct_t builder_t -> t
    end
    module Clause : sig
      type struct_t = [`Clause_adb9aafdab430c1d]
      type t = struct_t reader_t
      val has_loc : t -> bool
      val loc_get : t -> Loc.t
      val loc_get_pipelined : struct_t MessageWrapper.StructRef.t -> Loc.struct_t MessageWrapper.StructRef.t
      val has_text : t -> bool
      val text_get : t -> string
      val of_message : 'cap message_t -> t
      val of_builder : struct_t builder_t -> t
    end
    module RecordKind : sig
      type t = RecordKind_12907431634679073908.t =
        | Struc
        | Class
        | Unio
        | Undefined of int
    end
    module RecordRef : sig
      type struct_t = [`RecordRef_ec96558d3909990f]
      type t = struct_t reader_t
      val has_name : t -> bool
      val name_get : t -> string
      val kind_get : t -> RecordKind.t
      val of_message : 'cap message_t -> t
      val of_builder : struct_t builder_t -> t
    end
    module Param : sig
      type struct_t = [`Param_ab35d5180cf244f1]
      type t = struct_t reader_t
      val has_type : t -> bool
      val type_get : t -> Node.t
      val type_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
      val has_name : t -> bool
      val name_get : t -> string
      val has_default : t -> bool
      val default_get : t -> Node.t
      val default_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
      val of_message : 'cap message_t -> t
      val of_builder : struct_t builder_t -> t
    end
    module Type : sig
      type struct_t = [`Type_f4d8929c89991d82]
      type t = struct_t reader_t
      module BuiltinKind : sig
        type t = BuiltinKind_11913544707969661485.t =
          | Char
          | UChar
          | Short
          | UShort
          | Void
          | Bool
          | Int
          | UInt
          | Long
          | ULong
          | LongLong
          | ULongLong
          | Undefined of int
      end
      module FixedWidth : sig
        type struct_t = [`FixedWidth_90f48d4b27818920]
        type t = struct_t reader_t
        module FixedWidthKind : sig
          type t = FixedWidthKind_14562236601123920723.t =
            | Int
            | UInt
            | Undefined of int
        end
        val kind_get : t -> FixedWidthKind_14562236601123920723.t
        val bits_get : t -> int
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      module FunctionProto : sig
        type struct_t = [`FunctionProto_fa3f1e437e0e73dc]
        type t = struct_t reader_t
        val has_return_type : t -> bool
        val return_type_get : t -> Node.t
        val return_type_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
        val has_ghost_params : t -> bool
        val ghost_params_get : t -> (ro, Clause.t, array_t) Capnp.Array.t
        val ghost_params_get_list : t -> Clause.t list
        val ghost_params_get_array : t -> Clause.t array
        val has_params : t -> bool
        val params_get : t -> (ro, Param.t, array_t) Capnp.Array.t
        val params_get_list : t -> Param.t list
        val params_get_array : t -> Param.t array
        val has_contract : t -> bool
        val contract_get : t -> (ro, Clause.t, array_t) Capnp.Array.t
        val contract_get_list : t -> Clause.t list
        val contract_get_array : t -> Clause.t array
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      type unnamed_union_t =
        | UnionNotInitialized
        | Builtin of BuiltinKind_11913544707969661485.t
        | Pointer of Node.t
        | Record of RecordRef.t
        | EnumType of string
        | LValueRef of Node.t
        | RValueRef of Node.t
        | FixedWidth of [`FixedWidth_90f48d4b27818920] reader_t
        | Elaborated of Node.t
        | Typedef of string
        | FunctionProto of [`FunctionProto_fa3f1e437e0e73dc] reader_t
        | SubstTemplateTypeParam of Node.t
        | Undefined of int
      val get : t -> unnamed_union_t
      val of_message : 'cap message_t -> t
      val of_builder : struct_t builder_t -> t
    end
    module Stmt : sig
      type struct_t = [`Stmt_f6a0f771ad50816c]
      type t = struct_t reader_t
      module Return : sig
        type struct_t = [`Return_fe7af58e3af28b84]
        type t = struct_t reader_t
        val has_expr : t -> bool
        val expr_get : t -> Node.t
        val expr_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      module If : sig
        type struct_t = [`If_bfef959001088175]
        type t = struct_t reader_t
        val has_cond : t -> bool
        val cond_get : t -> Node.t
        val cond_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
        val has_then : t -> bool
        val then_get : t -> Node.t
        val then_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
        val has_else : t -> bool
        val else_get : t -> Node.t
        val else_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      module Compound : sig
        type struct_t = [`Compound_899b868295a7b9ce]
        type t = struct_t reader_t
        val has_stmts : t -> bool
        val stmts_get : t -> (ro, Node.t, array_t) Capnp.Array.t
        val stmts_get_list : t -> Node.t list
        val stmts_get_array : t -> Node.t array
        val has_r_brace : t -> bool
        val r_brace_get : t -> Loc.t
        val r_brace_get_pipelined : struct_t MessageWrapper.StructRef.t -> Loc.struct_t MessageWrapper.StructRef.t
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      module While : sig
        type struct_t = [`While_ef7716d0539edb37]
        type t = struct_t reader_t
        val has_cond : t -> bool
        val cond_get : t -> Node.t
        val cond_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
        val has_body : t -> bool
        val body_get : t -> Node.t
        val body_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
        val has_spec : t -> bool
        val spec_get : t -> (ro, Clause.t, array_t) Capnp.Array.t
        val spec_get_list : t -> Clause.t list
        val spec_get_array : t -> Clause.t array
        val has_while_loc : t -> bool
        val while_loc_get : t -> Loc.t
        val while_loc_get_pipelined : struct_t MessageWrapper.StructRef.t -> Loc.struct_t MessageWrapper.StructRef.t
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      module Case : sig
        type struct_t = [`Case_d41d9dffe36da558]
        type t = struct_t reader_t
        val has_lhs : t -> bool
        val lhs_get : t -> Node.t
        val lhs_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
        val has_stmt : t -> bool
        val stmt_get : t -> Node.t
        val stmt_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      module DefCase : sig
        type struct_t = [`DefCase_ef0bcc479ff59f3e]
        type t = struct_t reader_t
        val has_stmt : t -> bool
        val stmt_get : t -> Node.t
        val stmt_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      module Switch : sig
        type struct_t = [`Switch_ffc6828955aafac4]
        type t = struct_t reader_t
        val has_cond : t -> bool
        val cond_get : t -> Node.t
        val cond_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
        val has_cases : t -> bool
        val cases_get : t -> (ro, Node.t, array_t) Capnp.Array.t
        val cases_get_list : t -> Node.t list
        val cases_get_array : t -> Node.t array
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      type unnamed_union_t =
        | UnionNotInitialized
        | Ann of string
        | Decl of (ro, Node.t, array_t) Capnp.Array.t
        | Compound of [`Compound_899b868295a7b9ce] reader_t
        | Expr of Node.t
        | Return of [`Return_fe7af58e3af28b84] reader_t
        | If of [`If_bfef959001088175] reader_t
        | Null
        | While of [`While_ef7716d0539edb37] reader_t
        | DoWhile of [`While_ef7716d0539edb37] reader_t
        | Break
        | Continue
        | Switch of [`Switch_ffc6828955aafac4] reader_t
        | Case of [`Case_d41d9dffe36da558] reader_t
        | DefCase of [`DefCase_ef0bcc479ff59f3e] reader_t
        | Undefined of int
      val get : t -> unnamed_union_t
      val of_message : 'cap message_t -> t
      val of_builder : struct_t builder_t -> t
    end
    module Decl : sig
      type struct_t = [`Decl_d96c7f8624e22938]
      type t = struct_t reader_t
      module Var : sig
        type struct_t = [`Var_8da2907bb130c41c]
        type t = struct_t reader_t
        module InitStyle : sig
          type t = InitStyle_15285372864656172726.t =
            | CInit
            | CallInit
            | ListInit
            | Undefined of int
        end
        module VarInit : sig
          type struct_t = [`VarInit_96ff0430cb165092]
          type t = struct_t reader_t
          val has_init : t -> bool
          val init_get : t -> Node.t
          val init_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
          val style_get : t -> InitStyle.t
          val of_message : 'cap message_t -> t
          val of_builder : struct_t builder_t -> t
        end
        val has_name : t -> bool
        val name_get : t -> string
        val has_type : t -> bool
        val type_get : t -> Node.t
        val type_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
        val has_init : t -> bool
        val init_get : t -> [`VarInit_96ff0430cb165092] reader_t
        val init_get_pipelined : struct_t MessageWrapper.StructRef.t -> [`VarInit_96ff0430cb165092] MessageWrapper.StructRef.t
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      module Function : sig
        type struct_t = [`Function_d64c65470b140c81]
        type t = struct_t reader_t
        val has_name : t -> bool
        val name_get : t -> string
        val has_body : t -> bool
        val body_get : t -> Node.t
        val body_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
        val has_result : t -> bool
        val result_get : t -> Node.t
        val result_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
        val has_params : t -> bool
        val params_get : t -> (ro, Param.t, array_t) Capnp.Array.t
        val params_get_list : t -> Param.t list
        val params_get_array : t -> Param.t array
        val has_contract : t -> bool
        val contract_get : t -> (ro, Clause.t, array_t) Capnp.Array.t
        val contract_get_list : t -> Clause.t list
        val contract_get_array : t -> Clause.t array
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      module Field : sig
        type struct_t = [`Field_ca43d1968400194b]
        type t = struct_t reader_t
        module InitStyle : sig
          type t = InitStyle_13739150215916644662.t =
            | CopyInit
            | ListInit
            | Undefined of int
        end
        module FieldInit : sig
          type struct_t = [`FieldInit_91afac6d2dc82432]
          type t = struct_t reader_t
          val has_init : t -> bool
          val init_get : t -> Node.t
          val init_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
          val style_get : t -> InitStyle.t
          val of_message : 'cap message_t -> t
          val of_builder : struct_t builder_t -> t
        end
        val has_name : t -> bool
        val name_get : t -> string
        val has_type : t -> bool
        val type_get : t -> Node.t
        val type_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
        val has_init : t -> bool
        val init_get : t -> [`FieldInit_91afac6d2dc82432] reader_t
        val init_get_pipelined : struct_t MessageWrapper.StructRef.t -> [`FieldInit_91afac6d2dc82432] MessageWrapper.StructRef.t
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      module Record : sig
        type struct_t = [`Record_c925b09644ce72d3]
        type t = struct_t reader_t
        module BaseSpec : sig
          type struct_t = [`BaseSpec_9ffaae697f26648e]
          type t = struct_t reader_t
          val has_name : t -> bool
          val name_get : t -> string
          val virtual_get : t -> bool
          val of_message : 'cap message_t -> t
          val of_builder : struct_t builder_t -> t
        end
        module Body : sig
          type struct_t = [`Body_d26ea0ac04b0689b]
          type t = struct_t reader_t
          val has_decls : t -> bool
          val decls_get : t -> (ro, Node.t, array_t) Capnp.Array.t
          val decls_get_list : t -> Node.t list
          val decls_get_array : t -> Node.t array
          val has_bases : t -> bool
          val bases_get : t -> (ro, Node.t, array_t) Capnp.Array.t
          val bases_get_list : t -> Node.t list
          val bases_get_array : t -> Node.t array
          val polymorphic_get : t -> bool
          val has_non_overridden_methods : t -> bool
          val non_overridden_methods_get : t -> (ro, string, array_t) Capnp.Array.t
          val non_overridden_methods_get_list : t -> string list
          val non_overridden_methods_get_array : t -> string array
          val is_abstract_get : t -> bool
          val of_message : 'cap message_t -> t
          val of_builder : struct_t builder_t -> t
        end
        val has_name : t -> bool
        val name_get : t -> string
        val kind_get : t -> RecordKind.t
        val has_body : t -> bool
        val body_get : t -> [`Body_d26ea0ac04b0689b] reader_t
        val body_get_pipelined : struct_t MessageWrapper.StructRef.t -> [`Body_d26ea0ac04b0689b] MessageWrapper.StructRef.t
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      module Method : sig
        type struct_t = [`Method_bebeef9161eb7d3c]
        type t = struct_t reader_t
        module Override : sig
          type struct_t = [`Override_e1a2673f5339803f]
          type t = struct_t reader_t
          val has_name : t -> bool
          val name_get : t -> string
          val has_base : t -> bool
          val base_get : t -> RecordRef.t
          val base_get_pipelined : struct_t MessageWrapper.StructRef.t -> RecordRef.struct_t MessageWrapper.StructRef.t
          val of_message : 'cap message_t -> t
          val of_builder : struct_t builder_t -> t
        end
        val static_get : t -> bool
        val has_func : t -> bool
        val func_get : t -> Function.t
        val func_get_pipelined : struct_t MessageWrapper.StructRef.t -> Function.struct_t MessageWrapper.StructRef.t
        val has_this : t -> bool
        val this_get : t -> Type.t
        val this_get_pipelined : struct_t MessageWrapper.StructRef.t -> Type.struct_t MessageWrapper.StructRef.t
        val implicit_get : t -> bool
        val virtual_get : t -> bool
        val has_overrides : t -> bool
        val overrides_get : t -> (ro, [`Override_e1a2673f5339803f] reader_t, array_t) Capnp.Array.t
        val overrides_get_list : t -> [`Override_e1a2673f5339803f] reader_t list
        val overrides_get_array : t -> [`Override_e1a2673f5339803f] reader_t array
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      module Ctor : sig
        type struct_t = [`Ctor_f64598c2842483ec]
        type t = struct_t reader_t
        module CtorInit : sig
          type struct_t = [`CtorInit_a31fa1100c324f2f]
          type t = struct_t reader_t
          val has_name : t -> bool
          val name_get : t -> string
          val has_init : t -> bool
          val init_get : t -> Node.t
          val init_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
          val is_written_get : t -> bool
          val of_message : 'cap message_t -> t
          val of_builder : struct_t builder_t -> t
        end
        val has_method : t -> bool
        val method_get : t -> Method.t
        val method_get_pipelined : struct_t MessageWrapper.StructRef.t -> Method.struct_t MessageWrapper.StructRef.t
        val has_init_list : t -> bool
        val init_list_get : t -> (ro, [`CtorInit_a31fa1100c324f2f] reader_t, array_t) Capnp.Array.t
        val init_list_get_list : t -> [`CtorInit_a31fa1100c324f2f] reader_t list
        val init_list_get_array : t -> [`CtorInit_a31fa1100c324f2f] reader_t array
        val has_parent : t -> bool
        val parent_get : t -> RecordRef.t
        val parent_get_pipelined : struct_t MessageWrapper.StructRef.t -> RecordRef.struct_t MessageWrapper.StructRef.t
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      module Dtor : sig
        type struct_t = [`Dtor_88d58127ebcf6085]
        type t = struct_t reader_t
        val has_method : t -> bool
        val method_get : t -> Method.t
        val method_get_pipelined : struct_t MessageWrapper.StructRef.t -> Method.struct_t MessageWrapper.StructRef.t
        val has_parent : t -> bool
        val parent_get : t -> RecordRef.t
        val parent_get_pipelined : struct_t MessageWrapper.StructRef.t -> RecordRef.struct_t MessageWrapper.StructRef.t
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      module Typedef : sig
        type struct_t = [`Typedef_e46ae190d3365bca]
        type t = struct_t reader_t
        val has_type : t -> bool
        val type_get : t -> Node.t
        val type_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
        val has_name : t -> bool
        val name_get : t -> string
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      module Enum : sig
        type struct_t = [`Enum_daecdb4dcd868ea8]
        type t = struct_t reader_t
        module EnumField : sig
          type struct_t = [`EnumField_87676bdbadd4545d]
          type t = struct_t reader_t
          val has_name : t -> bool
          val name_get : t -> string
          val has_expr : t -> bool
          val expr_get : t -> Node.t
          val expr_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
          val of_message : 'cap message_t -> t
          val of_builder : struct_t builder_t -> t
        end
        val has_name : t -> bool
        val name_get : t -> string
        val has_fields : t -> bool
        val fields_get : t -> (ro, [`EnumField_87676bdbadd4545d] reader_t, array_t) Capnp.Array.t
        val fields_get_list : t -> [`EnumField_87676bdbadd4545d] reader_t list
        val fields_get_array : t -> [`EnumField_87676bdbadd4545d] reader_t array
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      module Namespace : sig
        type struct_t = [`Namespace_92f4588bb5c5df26]
        type t = struct_t reader_t
        val has_name : t -> bool
        val name_get : t -> string
        val has_decls : t -> bool
        val decls_get : t -> (ro, Node.t, array_t) Capnp.Array.t
        val decls_get_list : t -> Node.t list
        val decls_get_array : t -> Node.t array
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      module FunctionTemplate : sig
        type struct_t = [`FunctionTemplate_f8e83450e2ea65bc]
        type t = struct_t reader_t
        val has_name : t -> bool
        val name_get : t -> string
        val has_specs : t -> bool
        val specs_get : t -> (ro, Node.t, array_t) Capnp.Array.t
        val specs_get_list : t -> Node.t list
        val specs_get_array : t -> Node.t array
        val has_contract : t -> bool
        val contract_get : t -> (ro, Clause.t, array_t) Capnp.Array.t
        val contract_get_list : t -> Clause.t list
        val contract_get_array : t -> Clause.t array
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      module ClassTemplate : sig
        type struct_t = [`ClassTemplate_e6f1d45b2f7e3f2d]
        type t = struct_t reader_t
        val has_name : t -> bool
        val name_get : t -> string
        val has_specs : t -> bool
        val specs_get : t -> (ro, Node.t, array_t) Capnp.Array.t
        val specs_get_list : t -> Node.t list
        val specs_get_array : t -> Node.t array
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      type unnamed_union_t =
        | UnionNotInitialized
        | Ann of string
        | Empty
        | Var of [`Var_8da2907bb130c41c] reader_t
        | Function of [`Function_d64c65470b140c81] reader_t
        | Field of [`Field_ca43d1968400194b] reader_t
        | Record of [`Record_c925b09644ce72d3] reader_t
        | Method of [`Method_bebeef9161eb7d3c] reader_t
        | AccessSpec
        | Ctor of [`Ctor_f64598c2842483ec] reader_t
        | Dtor of [`Dtor_88d58127ebcf6085] reader_t
        | Typedef of [`Typedef_e46ae190d3365bca] reader_t
        | EnumDecl of [`Enum_daecdb4dcd868ea8] reader_t
        | Namespace of [`Namespace_92f4588bb5c5df26] reader_t
        | FunctionTemplate of [`FunctionTemplate_f8e83450e2ea65bc] reader_t
        | ClassTemplate of [`ClassTemplate_e6f1d45b2f7e3f2d] reader_t
        | Undefined of int
      val get : t -> unnamed_union_t
      val of_message : 'cap message_t -> t
      val of_builder : struct_t builder_t -> t
    end
    module UnaryOpKind : sig
      type t = UnaryOpKind_16270584510146119878.t =
        | Plus
        | Minus
        | Not
        | LNot
        | AddrOf
        | Deref
        | PreInc
        | PreDec
        | PostInc
        | PostDec
        | Undefined of int
    end
    module BinaryOpKind : sig
      type t = BinaryOpKind_15775553773985184773.t =
        | Add
        | Sub
        | Assign
        | Mul
        | Div
        | Rem
        | Shl
        | Shr
        | Lt
        | Gt
        | Le
        | Ge
        | Eq
        | Ne
        | And
        | Or
        | Xor
        | LAnd
        | LOr
        | MulAssign
        | DivAssign
        | RemAssign
        | AddAssign
        | SubAssign
        | ShlAssign
        | ShrAssign
        | AndAssign
        | XorAssign
        | OrAssign
        | Undefined of int
    end
    module SufKind : sig
      type t = SufKind_10349718269051794478.t =
        | LSuf
        | LLSuf
        | NoSuf
        | Undefined of int
    end
    module NbBase : sig
      type t = NbBase_15750048951651279863.t =
        | Decimal
        | Octal
        | Hex
        | Undefined of int
    end
    module Expr : sig
      type struct_t = [`Expr_d5d009cc85c86562]
      type t = struct_t reader_t
      module UnaryOp : sig
        type struct_t = [`UnaryOp_b525d86a8f48e679]
        type t = struct_t reader_t
        val has_operand : t -> bool
        val operand_get : t -> Node.t
        val operand_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
        val kind_get : t -> UnaryOpKind.t
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      module BinaryOp : sig
        type struct_t = [`BinaryOp_b95e9a5df08d277c]
        type t = struct_t reader_t
        val has_lhs : t -> bool
        val lhs_get : t -> Node.t
        val lhs_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
        val has_rhs : t -> bool
        val rhs_get : t -> Node.t
        val rhs_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
        val kind_get : t -> BinaryOpKind.t
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      module IntLit : sig
        type struct_t = [`IntLit_a21731ff472a9631]
        type t = struct_t reader_t
        val has_value : t -> bool
        val value_get : t -> string
        val u_suffix_get : t -> bool
        val l_suffix_get : t -> SufKind.t
        val base_get : t -> NbBase.t
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      module Call : sig
        type struct_t = [`Call_d6c567dfeede9b58]
        type t = struct_t reader_t
        val has_args : t -> bool
        val args_get : t -> (ro, Node.t, array_t) Capnp.Array.t
        val args_get_list : t -> Node.t list
        val args_get_array : t -> Node.t array
        val has_callee : t -> bool
        val callee_get : t -> Node.t
        val callee_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      module MemberCall : sig
        type struct_t = [`MemberCall_a4d76185fab22f27]
        type t = struct_t reader_t
        val has_implicit_arg : t -> bool
        val implicit_arg_get : t -> Node.t
        val implicit_arg_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
        val arrow_get : t -> bool
        val has_call : t -> bool
        val call_get : t -> Call.t
        val call_get_pipelined : struct_t MessageWrapper.StructRef.t -> Call.struct_t MessageWrapper.StructRef.t
        val target_has_qualifier_get : t -> bool
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      module Member : sig
        type struct_t = [`Member_ab509764d68e7721]
        type t = struct_t reader_t
        val has_base : t -> bool
        val base_get : t -> Node.t
        val base_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
        val has_name : t -> bool
        val name_get : t -> string
        val arrow_get : t -> bool
        val base_is_pointer_get : t -> bool
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      module New : sig
        type struct_t = [`New_e0dbc3751d359960]
        type t = struct_t reader_t
        val has_type : t -> bool
        val type_get : t -> Type.t
        val type_get_pipelined : struct_t MessageWrapper.StructRef.t -> Type.struct_t MessageWrapper.StructRef.t
        val has_expr : t -> bool
        val expr_get : t -> Node.t
        val expr_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      module Construct : sig
        type struct_t = [`Construct_9094c5b59016772f]
        type t = struct_t reader_t
        val has_name : t -> bool
        val name_get : t -> string
        val has_args : t -> bool
        val args_get : t -> (ro, Node.t, array_t) Capnp.Array.t
        val args_get_list : t -> Node.t list
        val args_get_array : t -> Node.t array
        val has_type : t -> bool
        val type_get : t -> Type.t
        val type_get_pipelined : struct_t MessageWrapper.StructRef.t -> Type.struct_t MessageWrapper.StructRef.t
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      module StructToStruct : sig
        type struct_t = [`StructToStruct_a6587e392992550d]
        type t = struct_t reader_t
        val has_expr : t -> bool
        val expr_get : t -> Node.t
        val expr_get_pipelined : struct_t MessageWrapper.StructRef.t -> Node.struct_t MessageWrapper.StructRef.t
        val has_type : t -> bool
        val type_get : t -> Type.t
        val type_get_pipelined : struct_t MessageWrapper.StructRef.t -> Type.struct_t MessageWrapper.StructRef.t
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      type unnamed_union_t =
        | UnionNotInitialized
        | UnaryOp of [`UnaryOp_b525d86a8f48e679] reader_t
        | BinaryOp of [`BinaryOp_b95e9a5df08d277c] reader_t
        | BoolLit of bool
        | IntLit of [`IntLit_a21731ff472a9631] reader_t
        | StringLit of string
        | Call of [`Call_d6c567dfeede9b58] reader_t
        | DeclRef of string
        | Member of [`Member_ab509764d68e7721] reader_t
        | This
        | MemberCall of [`MemberCall_a4d76185fab22f27] reader_t
        | New of [`New_e0dbc3751d359960] reader_t
        | Construct of [`Construct_9094c5b59016772f] reader_t
        | NullPtrLit
        | Delete of Node.t
        | Truncating of Node.t
        | LValueToRValue of Node.t
        | DerivedToBase of [`StructToStruct_a6587e392992550d] reader_t
        | BaseToDerived of [`StructToStruct_a6587e392992550d] reader_t
        | OperatorCall of [`Call_d6c567dfeede9b58] reader_t
        | Undefined of int
      val get : t -> unnamed_union_t
      val of_message : 'cap message_t -> t
      val of_builder : struct_t builder_t -> t
    end
    module Include : sig
      type struct_t = [`Include_ad2f528afe2c7941]
      type t = struct_t reader_t
      module RealInclude : sig
        type struct_t = [`RealInclude_98b043b3eb527a16]
        type t = struct_t reader_t
        val has_loc : t -> bool
        val loc_get : t -> Loc.t
        val loc_get_pipelined : struct_t MessageWrapper.StructRef.t -> Loc.struct_t MessageWrapper.StructRef.t
        val has_file_name : t -> bool
        val file_name_get : t -> string
        val fd_get : t -> int
        val has_includes : t -> bool
        val includes_get : t -> (ro, [`Include_ad2f528afe2c7941] reader_t, array_t) Capnp.Array.t
        val includes_get_list : t -> [`Include_ad2f528afe2c7941] reader_t list
        val includes_get_array : t -> [`Include_ad2f528afe2c7941] reader_t array
        val is_angled_get : t -> bool
        val of_message : 'cap message_t -> t
        val of_builder : struct_t builder_t -> t
      end
      type unnamed_union_t =
        | UnionNotInitialized
        | RealInclude of [`RealInclude_98b043b3eb527a16] reader_t
        | GhostInclude of Clause.t
        | Undefined of int
      val get : t -> unnamed_union_t
      val of_message : 'cap message_t -> t
      val of_builder : struct_t builder_t -> t
    end
    module File : sig
      type struct_t = [`File_8ae30723c7f4eeb7]
      type t = struct_t reader_t
      val fd_get : t -> int
      val has_path : t -> bool
      val path_get : t -> string
      val has_decls : t -> bool
      val decls_get : t -> (ro, Node.t, array_t) Capnp.Array.t
      val decls_get_list : t -> Node.t list
      val decls_get_array : t -> Node.t array
      val of_message : 'cap message_t -> t
      val of_builder : struct_t builder_t -> t
    end
    module TU : sig
      type struct_t = [`TU_c63033d95787d2ff]
      type t = struct_t reader_t
      val main_fd_get : t -> int
      val has_includes : t -> bool
      val includes_get : t -> (ro, Include.t, array_t) Capnp.Array.t
      val includes_get_list : t -> Include.t list
      val includes_get_array : t -> Include.t array
      val has_files : t -> bool
      val files_get : t -> (ro, File.t, array_t) Capnp.Array.t
      val files_get_list : t -> File.t list
      val files_get_array : t -> File.t array
      val has_fail_directives : t -> bool
      val fail_directives_get : t -> (ro, Clause.t, array_t) Capnp.Array.t
      val fail_directives_get_list : t -> Clause.t list
      val fail_directives_get_array : t -> Clause.t array
      val of_message : 'cap message_t -> t
      val of_builder : struct_t builder_t -> t
    end
    module Err : sig
      type struct_t = [`Err_9162b284a3cba818]
      type t = struct_t reader_t
      val has_loc : t -> bool
      val loc_get : t -> Loc.t
      val loc_get_pipelined : struct_t MessageWrapper.StructRef.t -> Loc.struct_t MessageWrapper.StructRef.t
      val has_reason : t -> bool
      val reason_get : t -> string
      val of_message : 'cap message_t -> t
      val of_builder : struct_t builder_t -> t
    end
    module VfError : sig
      type struct_t = [`VfError_a924c04c2f68f445]
      type t = struct_t reader_t
      val has_tu : t -> bool
      val tu_get : t -> TU.t
      val tu_get_pipelined : struct_t MessageWrapper.StructRef.t -> TU.struct_t MessageWrapper.StructRef.t
      val has_errors : t -> bool
      val errors_get : t -> (ro, Err.t, array_t) Capnp.Array.t
      val errors_get_list : t -> Err.t list
      val errors_get_array : t -> Err.t array
      val of_message : 'cap message_t -> t
      val of_builder : struct_t builder_t -> t
    end
    module SerResult : sig
      type struct_t = [`SerResult_a5cc2b3709c2654d]
      type t = struct_t reader_t
      type unnamed_union_t =
        | Ok of TU.t
        | ClangError
        | VfError of VfError.t
        | Undefined of int
      val get : t -> unnamed_union_t
      val of_message : 'cap message_t -> t
      val of_builder : struct_t builder_t -> t
    end
  end

  module Builder : sig
    type array_t = Reader.builder_array_t
    type reader_array_t = Reader.array_t
    type pointer_t = rw MessageWrapper.Slice.t
    module Loc : sig
      type struct_t = [`Loc_b1436df23fb200b4]
      type t = struct_t builder_t
      module SrcPos : sig
        type struct_t = [`SrcPos_80bc3ef5a3c049a0]
        type t = struct_t builder_t
        val l_get : t -> int
        val l_set_exn : t -> int -> unit
        val c_get : t -> int
        val c_set_exn : t -> int -> unit
        val fd_get : t -> int
        val fd_set_exn : t -> int -> unit
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      val has_start : t -> bool
      val start_get : t -> [`SrcPos_80bc3ef5a3c049a0] builder_t
      val start_set_reader : t -> [`SrcPos_80bc3ef5a3c049a0] reader_t -> [`SrcPos_80bc3ef5a3c049a0] builder_t
      val start_set_builder : t -> [`SrcPos_80bc3ef5a3c049a0] builder_t -> [`SrcPos_80bc3ef5a3c049a0] builder_t
      val start_init : t -> [`SrcPos_80bc3ef5a3c049a0] builder_t
      val has_end : t -> bool
      val end_get : t -> [`SrcPos_80bc3ef5a3c049a0] builder_t
      val end_set_reader : t -> [`SrcPos_80bc3ef5a3c049a0] reader_t -> [`SrcPos_80bc3ef5a3c049a0] builder_t
      val end_set_builder : t -> [`SrcPos_80bc3ef5a3c049a0] builder_t -> [`SrcPos_80bc3ef5a3c049a0] builder_t
      val end_init : t -> [`SrcPos_80bc3ef5a3c049a0] builder_t
      val of_message : rw message_t -> t
      val to_message : t -> rw message_t
      val to_reader : t -> struct_t reader_t
      val init_root : ?message_size:int -> unit -> t
      val init_pointer : pointer_t -> t
    end
    module Node : sig
      type struct_t = [`Node_e2a8b78aa50d684a]
      type t = struct_t builder_t
      val has_loc : t -> bool
      val loc_get : t -> Loc.t
      val loc_set_reader : t -> Loc.struct_t reader_t -> Loc.t
      val loc_set_builder : t -> Loc.t -> Loc.t
      val loc_init : t -> Loc.t
      val desc_get : t -> pointer_t
      val desc_get_interface : t -> 'a MessageWrapper.Capability.t option
      val desc_set : t -> pointer_t -> pointer_t
      val desc_set_reader : t -> Reader.pointer_t -> pointer_t
      val desc_set_interface : t -> 'a MessageWrapper.Capability.t option -> unit
      val of_message : rw message_t -> t
      val to_message : t -> rw message_t
      val to_reader : t -> struct_t reader_t
      val init_root : ?message_size:int -> unit -> t
      val init_pointer : pointer_t -> t
    end
    module Clause : sig
      type struct_t = [`Clause_adb9aafdab430c1d]
      type t = struct_t builder_t
      val has_loc : t -> bool
      val loc_get : t -> Loc.t
      val loc_set_reader : t -> Loc.struct_t reader_t -> Loc.t
      val loc_set_builder : t -> Loc.t -> Loc.t
      val loc_init : t -> Loc.t
      val has_text : t -> bool
      val text_get : t -> string
      val text_set : t -> string -> unit
      val of_message : rw message_t -> t
      val to_message : t -> rw message_t
      val to_reader : t -> struct_t reader_t
      val init_root : ?message_size:int -> unit -> t
      val init_pointer : pointer_t -> t
    end
    module RecordKind : sig
      type t = RecordKind_12907431634679073908.t =
        | Struc
        | Class
        | Unio
        | Undefined of int
    end
    module RecordRef : sig
      type struct_t = [`RecordRef_ec96558d3909990f]
      type t = struct_t builder_t
      val has_name : t -> bool
      val name_get : t -> string
      val name_set : t -> string -> unit
      val kind_get : t -> RecordKind.t
      val kind_set : t -> RecordKind.t -> unit
      val kind_set_unsafe : t -> RecordKind.t -> unit
      val of_message : rw message_t -> t
      val to_message : t -> rw message_t
      val to_reader : t -> struct_t reader_t
      val init_root : ?message_size:int -> unit -> t
      val init_pointer : pointer_t -> t
    end
    module Param : sig
      type struct_t = [`Param_ab35d5180cf244f1]
      type t = struct_t builder_t
      val has_type : t -> bool
      val type_get : t -> Node.t
      val type_set_reader : t -> Node.struct_t reader_t -> Node.t
      val type_set_builder : t -> Node.t -> Node.t
      val type_init : t -> Node.t
      val has_name : t -> bool
      val name_get : t -> string
      val name_set : t -> string -> unit
      val has_default : t -> bool
      val default_get : t -> Node.t
      val default_set_reader : t -> Node.struct_t reader_t -> Node.t
      val default_set_builder : t -> Node.t -> Node.t
      val default_init : t -> Node.t
      val of_message : rw message_t -> t
      val to_message : t -> rw message_t
      val to_reader : t -> struct_t reader_t
      val init_root : ?message_size:int -> unit -> t
      val init_pointer : pointer_t -> t
    end
    module Type : sig
      type struct_t = [`Type_f4d8929c89991d82]
      type t = struct_t builder_t
      module BuiltinKind : sig
        type t = BuiltinKind_11913544707969661485.t =
          | Char
          | UChar
          | Short
          | UShort
          | Void
          | Bool
          | Int
          | UInt
          | Long
          | ULong
          | LongLong
          | ULongLong
          | Undefined of int
      end
      module FixedWidth : sig
        type struct_t = [`FixedWidth_90f48d4b27818920]
        type t = struct_t builder_t
        module FixedWidthKind : sig
          type t = FixedWidthKind_14562236601123920723.t =
            | Int
            | UInt
            | Undefined of int
        end
        val kind_get : t -> FixedWidthKind_14562236601123920723.t
        val kind_set : t -> FixedWidthKind_14562236601123920723.t -> unit
        val kind_set_unsafe : t -> FixedWidthKind_14562236601123920723.t -> unit
        val bits_get : t -> int
        val bits_set_exn : t -> int -> unit
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      module FunctionProto : sig
        type struct_t = [`FunctionProto_fa3f1e437e0e73dc]
        type t = struct_t builder_t
        val has_return_type : t -> bool
        val return_type_get : t -> Node.t
        val return_type_set_reader : t -> Node.struct_t reader_t -> Node.t
        val return_type_set_builder : t -> Node.t -> Node.t
        val return_type_init : t -> Node.t
        val has_ghost_params : t -> bool
        val ghost_params_get : t -> (rw, Clause.t, array_t) Capnp.Array.t
        val ghost_params_get_list : t -> Clause.t list
        val ghost_params_get_array : t -> Clause.t array
        val ghost_params_set : t -> (rw, Clause.t, array_t) Capnp.Array.t -> (rw, Clause.t, array_t) Capnp.Array.t
        val ghost_params_set_list : t -> Clause.t list -> (rw, Clause.t, array_t) Capnp.Array.t
        val ghost_params_set_array : t -> Clause.t array -> (rw, Clause.t, array_t) Capnp.Array.t
        val ghost_params_init : t -> int -> (rw, Clause.t, array_t) Capnp.Array.t
        val has_params : t -> bool
        val params_get : t -> (rw, Param.t, array_t) Capnp.Array.t
        val params_get_list : t -> Param.t list
        val params_get_array : t -> Param.t array
        val params_set : t -> (rw, Param.t, array_t) Capnp.Array.t -> (rw, Param.t, array_t) Capnp.Array.t
        val params_set_list : t -> Param.t list -> (rw, Param.t, array_t) Capnp.Array.t
        val params_set_array : t -> Param.t array -> (rw, Param.t, array_t) Capnp.Array.t
        val params_init : t -> int -> (rw, Param.t, array_t) Capnp.Array.t
        val has_contract : t -> bool
        val contract_get : t -> (rw, Clause.t, array_t) Capnp.Array.t
        val contract_get_list : t -> Clause.t list
        val contract_get_array : t -> Clause.t array
        val contract_set : t -> (rw, Clause.t, array_t) Capnp.Array.t -> (rw, Clause.t, array_t) Capnp.Array.t
        val contract_set_list : t -> Clause.t list -> (rw, Clause.t, array_t) Capnp.Array.t
        val contract_set_array : t -> Clause.t array -> (rw, Clause.t, array_t) Capnp.Array.t
        val contract_init : t -> int -> (rw, Clause.t, array_t) Capnp.Array.t
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      type unnamed_union_t =
        | UnionNotInitialized
        | Builtin of BuiltinKind_11913544707969661485.t
        | Pointer of Node.t
        | Record of RecordRef.t
        | EnumType of string
        | LValueRef of Node.t
        | RValueRef of Node.t
        | FixedWidth of [`FixedWidth_90f48d4b27818920] builder_t
        | Elaborated of Node.t
        | Typedef of string
        | FunctionProto of [`FunctionProto_fa3f1e437e0e73dc] builder_t
        | SubstTemplateTypeParam of Node.t
        | Undefined of int
      val get : t -> unnamed_union_t
      val union_not_initialized_set : t -> unit
      val builtin_set : t -> BuiltinKind_11913544707969661485.t -> unit
      val builtin_set_unsafe : t -> BuiltinKind_11913544707969661485.t -> unit
      val pointer_set_reader : t -> Node.struct_t reader_t -> Node.t
      val pointer_set_builder : t -> Node.t -> Node.t
      val pointer_init : t -> Node.t
      val record_set_reader : t -> RecordRef.struct_t reader_t -> RecordRef.t
      val record_set_builder : t -> RecordRef.t -> RecordRef.t
      val record_init : t -> RecordRef.t
      val enum_type_set : t -> string -> unit
      val l_value_ref_set_reader : t -> Node.struct_t reader_t -> Node.t
      val l_value_ref_set_builder : t -> Node.t -> Node.t
      val l_value_ref_init : t -> Node.t
      val r_value_ref_set_reader : t -> Node.struct_t reader_t -> Node.t
      val r_value_ref_set_builder : t -> Node.t -> Node.t
      val r_value_ref_init : t -> Node.t
      val fixed_width_set_reader : t -> [`FixedWidth_90f48d4b27818920] reader_t -> [`FixedWidth_90f48d4b27818920] builder_t
      val fixed_width_set_builder : t -> [`FixedWidth_90f48d4b27818920] builder_t -> [`FixedWidth_90f48d4b27818920] builder_t
      val fixed_width_init : t -> [`FixedWidth_90f48d4b27818920] builder_t
      val elaborated_set_reader : t -> Node.struct_t reader_t -> Node.t
      val elaborated_set_builder : t -> Node.t -> Node.t
      val elaborated_init : t -> Node.t
      val typedef_set : t -> string -> unit
      val function_proto_set_reader : t -> [`FunctionProto_fa3f1e437e0e73dc] reader_t -> [`FunctionProto_fa3f1e437e0e73dc] builder_t
      val function_proto_set_builder : t -> [`FunctionProto_fa3f1e437e0e73dc] builder_t -> [`FunctionProto_fa3f1e437e0e73dc] builder_t
      val function_proto_init : t -> [`FunctionProto_fa3f1e437e0e73dc] builder_t
      val subst_template_type_param_set_reader : t -> Node.struct_t reader_t -> Node.t
      val subst_template_type_param_set_builder : t -> Node.t -> Node.t
      val subst_template_type_param_init : t -> Node.t
      val of_message : rw message_t -> t
      val to_message : t -> rw message_t
      val to_reader : t -> struct_t reader_t
      val init_root : ?message_size:int -> unit -> t
      val init_pointer : pointer_t -> t
    end
    module Stmt : sig
      type struct_t = [`Stmt_f6a0f771ad50816c]
      type t = struct_t builder_t
      module Return : sig
        type struct_t = [`Return_fe7af58e3af28b84]
        type t = struct_t builder_t
        val has_expr : t -> bool
        val expr_get : t -> Node.t
        val expr_set_reader : t -> Node.struct_t reader_t -> Node.t
        val expr_set_builder : t -> Node.t -> Node.t
        val expr_init : t -> Node.t
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      module If : sig
        type struct_t = [`If_bfef959001088175]
        type t = struct_t builder_t
        val has_cond : t -> bool
        val cond_get : t -> Node.t
        val cond_set_reader : t -> Node.struct_t reader_t -> Node.t
        val cond_set_builder : t -> Node.t -> Node.t
        val cond_init : t -> Node.t
        val has_then : t -> bool
        val then_get : t -> Node.t
        val then_set_reader : t -> Node.struct_t reader_t -> Node.t
        val then_set_builder : t -> Node.t -> Node.t
        val then_init : t -> Node.t
        val has_else : t -> bool
        val else_get : t -> Node.t
        val else_set_reader : t -> Node.struct_t reader_t -> Node.t
        val else_set_builder : t -> Node.t -> Node.t
        val else_init : t -> Node.t
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      module Compound : sig
        type struct_t = [`Compound_899b868295a7b9ce]
        type t = struct_t builder_t
        val has_stmts : t -> bool
        val stmts_get : t -> (rw, Node.t, array_t) Capnp.Array.t
        val stmts_get_list : t -> Node.t list
        val stmts_get_array : t -> Node.t array
        val stmts_set : t -> (rw, Node.t, array_t) Capnp.Array.t -> (rw, Node.t, array_t) Capnp.Array.t
        val stmts_set_list : t -> Node.t list -> (rw, Node.t, array_t) Capnp.Array.t
        val stmts_set_array : t -> Node.t array -> (rw, Node.t, array_t) Capnp.Array.t
        val stmts_init : t -> int -> (rw, Node.t, array_t) Capnp.Array.t
        val has_r_brace : t -> bool
        val r_brace_get : t -> Loc.t
        val r_brace_set_reader : t -> Loc.struct_t reader_t -> Loc.t
        val r_brace_set_builder : t -> Loc.t -> Loc.t
        val r_brace_init : t -> Loc.t
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      module While : sig
        type struct_t = [`While_ef7716d0539edb37]
        type t = struct_t builder_t
        val has_cond : t -> bool
        val cond_get : t -> Node.t
        val cond_set_reader : t -> Node.struct_t reader_t -> Node.t
        val cond_set_builder : t -> Node.t -> Node.t
        val cond_init : t -> Node.t
        val has_body : t -> bool
        val body_get : t -> Node.t
        val body_set_reader : t -> Node.struct_t reader_t -> Node.t
        val body_set_builder : t -> Node.t -> Node.t
        val body_init : t -> Node.t
        val has_spec : t -> bool
        val spec_get : t -> (rw, Clause.t, array_t) Capnp.Array.t
        val spec_get_list : t -> Clause.t list
        val spec_get_array : t -> Clause.t array
        val spec_set : t -> (rw, Clause.t, array_t) Capnp.Array.t -> (rw, Clause.t, array_t) Capnp.Array.t
        val spec_set_list : t -> Clause.t list -> (rw, Clause.t, array_t) Capnp.Array.t
        val spec_set_array : t -> Clause.t array -> (rw, Clause.t, array_t) Capnp.Array.t
        val spec_init : t -> int -> (rw, Clause.t, array_t) Capnp.Array.t
        val has_while_loc : t -> bool
        val while_loc_get : t -> Loc.t
        val while_loc_set_reader : t -> Loc.struct_t reader_t -> Loc.t
        val while_loc_set_builder : t -> Loc.t -> Loc.t
        val while_loc_init : t -> Loc.t
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      module Case : sig
        type struct_t = [`Case_d41d9dffe36da558]
        type t = struct_t builder_t
        val has_lhs : t -> bool
        val lhs_get : t -> Node.t
        val lhs_set_reader : t -> Node.struct_t reader_t -> Node.t
        val lhs_set_builder : t -> Node.t -> Node.t
        val lhs_init : t -> Node.t
        val has_stmt : t -> bool
        val stmt_get : t -> Node.t
        val stmt_set_reader : t -> Node.struct_t reader_t -> Node.t
        val stmt_set_builder : t -> Node.t -> Node.t
        val stmt_init : t -> Node.t
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      module DefCase : sig
        type struct_t = [`DefCase_ef0bcc479ff59f3e]
        type t = struct_t builder_t
        val has_stmt : t -> bool
        val stmt_get : t -> Node.t
        val stmt_set_reader : t -> Node.struct_t reader_t -> Node.t
        val stmt_set_builder : t -> Node.t -> Node.t
        val stmt_init : t -> Node.t
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      module Switch : sig
        type struct_t = [`Switch_ffc6828955aafac4]
        type t = struct_t builder_t
        val has_cond : t -> bool
        val cond_get : t -> Node.t
        val cond_set_reader : t -> Node.struct_t reader_t -> Node.t
        val cond_set_builder : t -> Node.t -> Node.t
        val cond_init : t -> Node.t
        val has_cases : t -> bool
        val cases_get : t -> (rw, Node.t, array_t) Capnp.Array.t
        val cases_get_list : t -> Node.t list
        val cases_get_array : t -> Node.t array
        val cases_set : t -> (rw, Node.t, array_t) Capnp.Array.t -> (rw, Node.t, array_t) Capnp.Array.t
        val cases_set_list : t -> Node.t list -> (rw, Node.t, array_t) Capnp.Array.t
        val cases_set_array : t -> Node.t array -> (rw, Node.t, array_t) Capnp.Array.t
        val cases_init : t -> int -> (rw, Node.t, array_t) Capnp.Array.t
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      type unnamed_union_t =
        | UnionNotInitialized
        | Ann of string
        | Decl of (rw, Node.t, array_t) Capnp.Array.t
        | Compound of [`Compound_899b868295a7b9ce] builder_t
        | Expr of Node.t
        | Return of [`Return_fe7af58e3af28b84] builder_t
        | If of [`If_bfef959001088175] builder_t
        | Null
        | While of [`While_ef7716d0539edb37] builder_t
        | DoWhile of [`While_ef7716d0539edb37] builder_t
        | Break
        | Continue
        | Switch of [`Switch_ffc6828955aafac4] builder_t
        | Case of [`Case_d41d9dffe36da558] builder_t
        | DefCase of [`DefCase_ef0bcc479ff59f3e] builder_t
        | Undefined of int
      val get : t -> unnamed_union_t
      val union_not_initialized_set : t -> unit
      val ann_set : t -> string -> unit
      val decl_set : t -> (rw, Node.t, array_t) Capnp.Array.t -> (rw, Node.t, array_t) Capnp.Array.t
      val decl_set_list : t -> Node.t list -> (rw, Node.t, array_t) Capnp.Array.t
      val decl_set_array : t -> Node.t array -> (rw, Node.t, array_t) Capnp.Array.t
      val decl_init : t -> int -> (rw, Node.t, array_t) Capnp.Array.t
      val compound_set_reader : t -> [`Compound_899b868295a7b9ce] reader_t -> [`Compound_899b868295a7b9ce] builder_t
      val compound_set_builder : t -> [`Compound_899b868295a7b9ce] builder_t -> [`Compound_899b868295a7b9ce] builder_t
      val compound_init : t -> [`Compound_899b868295a7b9ce] builder_t
      val expr_set_reader : t -> Node.struct_t reader_t -> Node.t
      val expr_set_builder : t -> Node.t -> Node.t
      val expr_init : t -> Node.t
      val return_set_reader : t -> [`Return_fe7af58e3af28b84] reader_t -> [`Return_fe7af58e3af28b84] builder_t
      val return_set_builder : t -> [`Return_fe7af58e3af28b84] builder_t -> [`Return_fe7af58e3af28b84] builder_t
      val return_init : t -> [`Return_fe7af58e3af28b84] builder_t
      val if_set_reader : t -> [`If_bfef959001088175] reader_t -> [`If_bfef959001088175] builder_t
      val if_set_builder : t -> [`If_bfef959001088175] builder_t -> [`If_bfef959001088175] builder_t
      val if_init : t -> [`If_bfef959001088175] builder_t
      val null_set : t -> unit
      val while_set_reader : t -> [`While_ef7716d0539edb37] reader_t -> [`While_ef7716d0539edb37] builder_t
      val while_set_builder : t -> [`While_ef7716d0539edb37] builder_t -> [`While_ef7716d0539edb37] builder_t
      val while_init : t -> [`While_ef7716d0539edb37] builder_t
      val do_while_set_reader : t -> [`While_ef7716d0539edb37] reader_t -> [`While_ef7716d0539edb37] builder_t
      val do_while_set_builder : t -> [`While_ef7716d0539edb37] builder_t -> [`While_ef7716d0539edb37] builder_t
      val do_while_init : t -> [`While_ef7716d0539edb37] builder_t
      val break_set : t -> unit
      val continue_set : t -> unit
      val switch_set_reader : t -> [`Switch_ffc6828955aafac4] reader_t -> [`Switch_ffc6828955aafac4] builder_t
      val switch_set_builder : t -> [`Switch_ffc6828955aafac4] builder_t -> [`Switch_ffc6828955aafac4] builder_t
      val switch_init : t -> [`Switch_ffc6828955aafac4] builder_t
      val case_set_reader : t -> [`Case_d41d9dffe36da558] reader_t -> [`Case_d41d9dffe36da558] builder_t
      val case_set_builder : t -> [`Case_d41d9dffe36da558] builder_t -> [`Case_d41d9dffe36da558] builder_t
      val case_init : t -> [`Case_d41d9dffe36da558] builder_t
      val def_case_set_reader : t -> [`DefCase_ef0bcc479ff59f3e] reader_t -> [`DefCase_ef0bcc479ff59f3e] builder_t
      val def_case_set_builder : t -> [`DefCase_ef0bcc479ff59f3e] builder_t -> [`DefCase_ef0bcc479ff59f3e] builder_t
      val def_case_init : t -> [`DefCase_ef0bcc479ff59f3e] builder_t
      val of_message : rw message_t -> t
      val to_message : t -> rw message_t
      val to_reader : t -> struct_t reader_t
      val init_root : ?message_size:int -> unit -> t
      val init_pointer : pointer_t -> t
    end
    module Decl : sig
      type struct_t = [`Decl_d96c7f8624e22938]
      type t = struct_t builder_t
      module Var : sig
        type struct_t = [`Var_8da2907bb130c41c]
        type t = struct_t builder_t
        module InitStyle : sig
          type t = InitStyle_15285372864656172726.t =
            | CInit
            | CallInit
            | ListInit
            | Undefined of int
        end
        module VarInit : sig
          type struct_t = [`VarInit_96ff0430cb165092]
          type t = struct_t builder_t
          val has_init : t -> bool
          val init_get : t -> Node.t
          val init_set_reader : t -> Node.struct_t reader_t -> Node.t
          val init_set_builder : t -> Node.t -> Node.t
          val init_init : t -> Node.t
          val style_get : t -> InitStyle.t
          val style_set : t -> InitStyle.t -> unit
          val style_set_unsafe : t -> InitStyle.t -> unit
          val of_message : rw message_t -> t
          val to_message : t -> rw message_t
          val to_reader : t -> struct_t reader_t
          val init_root : ?message_size:int -> unit -> t
          val init_pointer : pointer_t -> t
        end
        val has_name : t -> bool
        val name_get : t -> string
        val name_set : t -> string -> unit
        val has_type : t -> bool
        val type_get : t -> Node.t
        val type_set_reader : t -> Node.struct_t reader_t -> Node.t
        val type_set_builder : t -> Node.t -> Node.t
        val type_init : t -> Node.t
        val has_init : t -> bool
        val init_get : t -> [`VarInit_96ff0430cb165092] builder_t
        val init_set_reader : t -> [`VarInit_96ff0430cb165092] reader_t -> [`VarInit_96ff0430cb165092] builder_t
        val init_set_builder : t -> [`VarInit_96ff0430cb165092] builder_t -> [`VarInit_96ff0430cb165092] builder_t
        val init_init : t -> [`VarInit_96ff0430cb165092] builder_t
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      module Function : sig
        type struct_t = [`Function_d64c65470b140c81]
        type t = struct_t builder_t
        val has_name : t -> bool
        val name_get : t -> string
        val name_set : t -> string -> unit
        val has_body : t -> bool
        val body_get : t -> Node.t
        val body_set_reader : t -> Node.struct_t reader_t -> Node.t
        val body_set_builder : t -> Node.t -> Node.t
        val body_init : t -> Node.t
        val has_result : t -> bool
        val result_get : t -> Node.t
        val result_set_reader : t -> Node.struct_t reader_t -> Node.t
        val result_set_builder : t -> Node.t -> Node.t
        val result_init : t -> Node.t
        val has_params : t -> bool
        val params_get : t -> (rw, Param.t, array_t) Capnp.Array.t
        val params_get_list : t -> Param.t list
        val params_get_array : t -> Param.t array
        val params_set : t -> (rw, Param.t, array_t) Capnp.Array.t -> (rw, Param.t, array_t) Capnp.Array.t
        val params_set_list : t -> Param.t list -> (rw, Param.t, array_t) Capnp.Array.t
        val params_set_array : t -> Param.t array -> (rw, Param.t, array_t) Capnp.Array.t
        val params_init : t -> int -> (rw, Param.t, array_t) Capnp.Array.t
        val has_contract : t -> bool
        val contract_get : t -> (rw, Clause.t, array_t) Capnp.Array.t
        val contract_get_list : t -> Clause.t list
        val contract_get_array : t -> Clause.t array
        val contract_set : t -> (rw, Clause.t, array_t) Capnp.Array.t -> (rw, Clause.t, array_t) Capnp.Array.t
        val contract_set_list : t -> Clause.t list -> (rw, Clause.t, array_t) Capnp.Array.t
        val contract_set_array : t -> Clause.t array -> (rw, Clause.t, array_t) Capnp.Array.t
        val contract_init : t -> int -> (rw, Clause.t, array_t) Capnp.Array.t
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      module Field : sig
        type struct_t = [`Field_ca43d1968400194b]
        type t = struct_t builder_t
        module InitStyle : sig
          type t = InitStyle_13739150215916644662.t =
            | CopyInit
            | ListInit
            | Undefined of int
        end
        module FieldInit : sig
          type struct_t = [`FieldInit_91afac6d2dc82432]
          type t = struct_t builder_t
          val has_init : t -> bool
          val init_get : t -> Node.t
          val init_set_reader : t -> Node.struct_t reader_t -> Node.t
          val init_set_builder : t -> Node.t -> Node.t
          val init_init : t -> Node.t
          val style_get : t -> InitStyle.t
          val style_set : t -> InitStyle.t -> unit
          val style_set_unsafe : t -> InitStyle.t -> unit
          val of_message : rw message_t -> t
          val to_message : t -> rw message_t
          val to_reader : t -> struct_t reader_t
          val init_root : ?message_size:int -> unit -> t
          val init_pointer : pointer_t -> t
        end
        val has_name : t -> bool
        val name_get : t -> string
        val name_set : t -> string -> unit
        val has_type : t -> bool
        val type_get : t -> Node.t
        val type_set_reader : t -> Node.struct_t reader_t -> Node.t
        val type_set_builder : t -> Node.t -> Node.t
        val type_init : t -> Node.t
        val has_init : t -> bool
        val init_get : t -> [`FieldInit_91afac6d2dc82432] builder_t
        val init_set_reader : t -> [`FieldInit_91afac6d2dc82432] reader_t -> [`FieldInit_91afac6d2dc82432] builder_t
        val init_set_builder : t -> [`FieldInit_91afac6d2dc82432] builder_t -> [`FieldInit_91afac6d2dc82432] builder_t
        val init_init : t -> [`FieldInit_91afac6d2dc82432] builder_t
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      module Record : sig
        type struct_t = [`Record_c925b09644ce72d3]
        type t = struct_t builder_t
        module BaseSpec : sig
          type struct_t = [`BaseSpec_9ffaae697f26648e]
          type t = struct_t builder_t
          val has_name : t -> bool
          val name_get : t -> string
          val name_set : t -> string -> unit
          val virtual_get : t -> bool
          val virtual_set : t -> bool -> unit
          val of_message : rw message_t -> t
          val to_message : t -> rw message_t
          val to_reader : t -> struct_t reader_t
          val init_root : ?message_size:int -> unit -> t
          val init_pointer : pointer_t -> t
        end
        module Body : sig
          type struct_t = [`Body_d26ea0ac04b0689b]
          type t = struct_t builder_t
          val has_decls : t -> bool
          val decls_get : t -> (rw, Node.t, array_t) Capnp.Array.t
          val decls_get_list : t -> Node.t list
          val decls_get_array : t -> Node.t array
          val decls_set : t -> (rw, Node.t, array_t) Capnp.Array.t -> (rw, Node.t, array_t) Capnp.Array.t
          val decls_set_list : t -> Node.t list -> (rw, Node.t, array_t) Capnp.Array.t
          val decls_set_array : t -> Node.t array -> (rw, Node.t, array_t) Capnp.Array.t
          val decls_init : t -> int -> (rw, Node.t, array_t) Capnp.Array.t
          val has_bases : t -> bool
          val bases_get : t -> (rw, Node.t, array_t) Capnp.Array.t
          val bases_get_list : t -> Node.t list
          val bases_get_array : t -> Node.t array
          val bases_set : t -> (rw, Node.t, array_t) Capnp.Array.t -> (rw, Node.t, array_t) Capnp.Array.t
          val bases_set_list : t -> Node.t list -> (rw, Node.t, array_t) Capnp.Array.t
          val bases_set_array : t -> Node.t array -> (rw, Node.t, array_t) Capnp.Array.t
          val bases_init : t -> int -> (rw, Node.t, array_t) Capnp.Array.t
          val polymorphic_get : t -> bool
          val polymorphic_set : t -> bool -> unit
          val has_non_overridden_methods : t -> bool
          val non_overridden_methods_get : t -> (rw, string, array_t) Capnp.Array.t
          val non_overridden_methods_get_list : t -> string list
          val non_overridden_methods_get_array : t -> string array
          val non_overridden_methods_set : t -> (rw, string, array_t) Capnp.Array.t -> (rw, string, array_t) Capnp.Array.t
          val non_overridden_methods_set_list : t -> string list -> (rw, string, array_t) Capnp.Array.t
          val non_overridden_methods_set_array : t -> string array -> (rw, string, array_t) Capnp.Array.t
          val non_overridden_methods_init : t -> int -> (rw, string, array_t) Capnp.Array.t
          val is_abstract_get : t -> bool
          val is_abstract_set : t -> bool -> unit
          val of_message : rw message_t -> t
          val to_message : t -> rw message_t
          val to_reader : t -> struct_t reader_t
          val init_root : ?message_size:int -> unit -> t
          val init_pointer : pointer_t -> t
        end
        val has_name : t -> bool
        val name_get : t -> string
        val name_set : t -> string -> unit
        val kind_get : t -> RecordKind.t
        val kind_set : t -> RecordKind.t -> unit
        val kind_set_unsafe : t -> RecordKind.t -> unit
        val has_body : t -> bool
        val body_get : t -> [`Body_d26ea0ac04b0689b] builder_t
        val body_set_reader : t -> [`Body_d26ea0ac04b0689b] reader_t -> [`Body_d26ea0ac04b0689b] builder_t
        val body_set_builder : t -> [`Body_d26ea0ac04b0689b] builder_t -> [`Body_d26ea0ac04b0689b] builder_t
        val body_init : t -> [`Body_d26ea0ac04b0689b] builder_t
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      module Method : sig
        type struct_t = [`Method_bebeef9161eb7d3c]
        type t = struct_t builder_t
        module Override : sig
          type struct_t = [`Override_e1a2673f5339803f]
          type t = struct_t builder_t
          val has_name : t -> bool
          val name_get : t -> string
          val name_set : t -> string -> unit
          val has_base : t -> bool
          val base_get : t -> RecordRef.t
          val base_set_reader : t -> RecordRef.struct_t reader_t -> RecordRef.t
          val base_set_builder : t -> RecordRef.t -> RecordRef.t
          val base_init : t -> RecordRef.t
          val of_message : rw message_t -> t
          val to_message : t -> rw message_t
          val to_reader : t -> struct_t reader_t
          val init_root : ?message_size:int -> unit -> t
          val init_pointer : pointer_t -> t
        end
        val static_get : t -> bool
        val static_set : t -> bool -> unit
        val has_func : t -> bool
        val func_get : t -> Function.t
        val func_set_reader : t -> Function.struct_t reader_t -> Function.t
        val func_set_builder : t -> Function.t -> Function.t
        val func_init : t -> Function.t
        val has_this : t -> bool
        val this_get : t -> Type.t
        val this_set_reader : t -> Type.struct_t reader_t -> Type.t
        val this_set_builder : t -> Type.t -> Type.t
        val this_init : t -> Type.t
        val implicit_get : t -> bool
        val implicit_set : t -> bool -> unit
        val virtual_get : t -> bool
        val virtual_set : t -> bool -> unit
        val has_overrides : t -> bool
        val overrides_get : t -> (rw, [`Override_e1a2673f5339803f] builder_t, array_t) Capnp.Array.t
        val overrides_get_list : t -> [`Override_e1a2673f5339803f] builder_t list
        val overrides_get_array : t -> [`Override_e1a2673f5339803f] builder_t array
        val overrides_set : t -> (rw, [`Override_e1a2673f5339803f] builder_t, array_t) Capnp.Array.t -> (rw, [`Override_e1a2673f5339803f] builder_t, array_t) Capnp.Array.t
        val overrides_set_list : t -> [`Override_e1a2673f5339803f] builder_t list -> (rw, [`Override_e1a2673f5339803f] builder_t, array_t) Capnp.Array.t
        val overrides_set_array : t -> [`Override_e1a2673f5339803f] builder_t array -> (rw, [`Override_e1a2673f5339803f] builder_t, array_t) Capnp.Array.t
        val overrides_init : t -> int -> (rw, [`Override_e1a2673f5339803f] builder_t, array_t) Capnp.Array.t
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      module Ctor : sig
        type struct_t = [`Ctor_f64598c2842483ec]
        type t = struct_t builder_t
        module CtorInit : sig
          type struct_t = [`CtorInit_a31fa1100c324f2f]
          type t = struct_t builder_t
          val has_name : t -> bool
          val name_get : t -> string
          val name_set : t -> string -> unit
          val has_init : t -> bool
          val init_get : t -> Node.t
          val init_set_reader : t -> Node.struct_t reader_t -> Node.t
          val init_set_builder : t -> Node.t -> Node.t
          val init_init : t -> Node.t
          val is_written_get : t -> bool
          val is_written_set : t -> bool -> unit
          val of_message : rw message_t -> t
          val to_message : t -> rw message_t
          val to_reader : t -> struct_t reader_t
          val init_root : ?message_size:int -> unit -> t
          val init_pointer : pointer_t -> t
        end
        val has_method : t -> bool
        val method_get : t -> Method.t
        val method_set_reader : t -> Method.struct_t reader_t -> Method.t
        val method_set_builder : t -> Method.t -> Method.t
        val method_init : t -> Method.t
        val has_init_list : t -> bool
        val init_list_get : t -> (rw, [`CtorInit_a31fa1100c324f2f] builder_t, array_t) Capnp.Array.t
        val init_list_get_list : t -> [`CtorInit_a31fa1100c324f2f] builder_t list
        val init_list_get_array : t -> [`CtorInit_a31fa1100c324f2f] builder_t array
        val init_list_set : t -> (rw, [`CtorInit_a31fa1100c324f2f] builder_t, array_t) Capnp.Array.t -> (rw, [`CtorInit_a31fa1100c324f2f] builder_t, array_t) Capnp.Array.t
        val init_list_set_list : t -> [`CtorInit_a31fa1100c324f2f] builder_t list -> (rw, [`CtorInit_a31fa1100c324f2f] builder_t, array_t) Capnp.Array.t
        val init_list_set_array : t -> [`CtorInit_a31fa1100c324f2f] builder_t array -> (rw, [`CtorInit_a31fa1100c324f2f] builder_t, array_t) Capnp.Array.t
        val init_list_init : t -> int -> (rw, [`CtorInit_a31fa1100c324f2f] builder_t, array_t) Capnp.Array.t
        val has_parent : t -> bool
        val parent_get : t -> RecordRef.t
        val parent_set_reader : t -> RecordRef.struct_t reader_t -> RecordRef.t
        val parent_set_builder : t -> RecordRef.t -> RecordRef.t
        val parent_init : t -> RecordRef.t
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      module Dtor : sig
        type struct_t = [`Dtor_88d58127ebcf6085]
        type t = struct_t builder_t
        val has_method : t -> bool
        val method_get : t -> Method.t
        val method_set_reader : t -> Method.struct_t reader_t -> Method.t
        val method_set_builder : t -> Method.t -> Method.t
        val method_init : t -> Method.t
        val has_parent : t -> bool
        val parent_get : t -> RecordRef.t
        val parent_set_reader : t -> RecordRef.struct_t reader_t -> RecordRef.t
        val parent_set_builder : t -> RecordRef.t -> RecordRef.t
        val parent_init : t -> RecordRef.t
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      module Typedef : sig
        type struct_t = [`Typedef_e46ae190d3365bca]
        type t = struct_t builder_t
        val has_type : t -> bool
        val type_get : t -> Node.t
        val type_set_reader : t -> Node.struct_t reader_t -> Node.t
        val type_set_builder : t -> Node.t -> Node.t
        val type_init : t -> Node.t
        val has_name : t -> bool
        val name_get : t -> string
        val name_set : t -> string -> unit
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      module Enum : sig
        type struct_t = [`Enum_daecdb4dcd868ea8]
        type t = struct_t builder_t
        module EnumField : sig
          type struct_t = [`EnumField_87676bdbadd4545d]
          type t = struct_t builder_t
          val has_name : t -> bool
          val name_get : t -> string
          val name_set : t -> string -> unit
          val has_expr : t -> bool
          val expr_get : t -> Node.t
          val expr_set_reader : t -> Node.struct_t reader_t -> Node.t
          val expr_set_builder : t -> Node.t -> Node.t
          val expr_init : t -> Node.t
          val of_message : rw message_t -> t
          val to_message : t -> rw message_t
          val to_reader : t -> struct_t reader_t
          val init_root : ?message_size:int -> unit -> t
          val init_pointer : pointer_t -> t
        end
        val has_name : t -> bool
        val name_get : t -> string
        val name_set : t -> string -> unit
        val has_fields : t -> bool
        val fields_get : t -> (rw, [`EnumField_87676bdbadd4545d] builder_t, array_t) Capnp.Array.t
        val fields_get_list : t -> [`EnumField_87676bdbadd4545d] builder_t list
        val fields_get_array : t -> [`EnumField_87676bdbadd4545d] builder_t array
        val fields_set : t -> (rw, [`EnumField_87676bdbadd4545d] builder_t, array_t) Capnp.Array.t -> (rw, [`EnumField_87676bdbadd4545d] builder_t, array_t) Capnp.Array.t
        val fields_set_list : t -> [`EnumField_87676bdbadd4545d] builder_t list -> (rw, [`EnumField_87676bdbadd4545d] builder_t, array_t) Capnp.Array.t
        val fields_set_array : t -> [`EnumField_87676bdbadd4545d] builder_t array -> (rw, [`EnumField_87676bdbadd4545d] builder_t, array_t) Capnp.Array.t
        val fields_init : t -> int -> (rw, [`EnumField_87676bdbadd4545d] builder_t, array_t) Capnp.Array.t
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      module Namespace : sig
        type struct_t = [`Namespace_92f4588bb5c5df26]
        type t = struct_t builder_t
        val has_name : t -> bool
        val name_get : t -> string
        val name_set : t -> string -> unit
        val has_decls : t -> bool
        val decls_get : t -> (rw, Node.t, array_t) Capnp.Array.t
        val decls_get_list : t -> Node.t list
        val decls_get_array : t -> Node.t array
        val decls_set : t -> (rw, Node.t, array_t) Capnp.Array.t -> (rw, Node.t, array_t) Capnp.Array.t
        val decls_set_list : t -> Node.t list -> (rw, Node.t, array_t) Capnp.Array.t
        val decls_set_array : t -> Node.t array -> (rw, Node.t, array_t) Capnp.Array.t
        val decls_init : t -> int -> (rw, Node.t, array_t) Capnp.Array.t
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      module FunctionTemplate : sig
        type struct_t = [`FunctionTemplate_f8e83450e2ea65bc]
        type t = struct_t builder_t
        val has_name : t -> bool
        val name_get : t -> string
        val name_set : t -> string -> unit
        val has_specs : t -> bool
        val specs_get : t -> (rw, Node.t, array_t) Capnp.Array.t
        val specs_get_list : t -> Node.t list
        val specs_get_array : t -> Node.t array
        val specs_set : t -> (rw, Node.t, array_t) Capnp.Array.t -> (rw, Node.t, array_t) Capnp.Array.t
        val specs_set_list : t -> Node.t list -> (rw, Node.t, array_t) Capnp.Array.t
        val specs_set_array : t -> Node.t array -> (rw, Node.t, array_t) Capnp.Array.t
        val specs_init : t -> int -> (rw, Node.t, array_t) Capnp.Array.t
        val has_contract : t -> bool
        val contract_get : t -> (rw, Clause.t, array_t) Capnp.Array.t
        val contract_get_list : t -> Clause.t list
        val contract_get_array : t -> Clause.t array
        val contract_set : t -> (rw, Clause.t, array_t) Capnp.Array.t -> (rw, Clause.t, array_t) Capnp.Array.t
        val contract_set_list : t -> Clause.t list -> (rw, Clause.t, array_t) Capnp.Array.t
        val contract_set_array : t -> Clause.t array -> (rw, Clause.t, array_t) Capnp.Array.t
        val contract_init : t -> int -> (rw, Clause.t, array_t) Capnp.Array.t
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      module ClassTemplate : sig
        type struct_t = [`ClassTemplate_e6f1d45b2f7e3f2d]
        type t = struct_t builder_t
        val has_name : t -> bool
        val name_get : t -> string
        val name_set : t -> string -> unit
        val has_specs : t -> bool
        val specs_get : t -> (rw, Node.t, array_t) Capnp.Array.t
        val specs_get_list : t -> Node.t list
        val specs_get_array : t -> Node.t array
        val specs_set : t -> (rw, Node.t, array_t) Capnp.Array.t -> (rw, Node.t, array_t) Capnp.Array.t
        val specs_set_list : t -> Node.t list -> (rw, Node.t, array_t) Capnp.Array.t
        val specs_set_array : t -> Node.t array -> (rw, Node.t, array_t) Capnp.Array.t
        val specs_init : t -> int -> (rw, Node.t, array_t) Capnp.Array.t
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      type unnamed_union_t =
        | UnionNotInitialized
        | Ann of string
        | Empty
        | Var of [`Var_8da2907bb130c41c] builder_t
        | Function of [`Function_d64c65470b140c81] builder_t
        | Field of [`Field_ca43d1968400194b] builder_t
        | Record of [`Record_c925b09644ce72d3] builder_t
        | Method of [`Method_bebeef9161eb7d3c] builder_t
        | AccessSpec
        | Ctor of [`Ctor_f64598c2842483ec] builder_t
        | Dtor of [`Dtor_88d58127ebcf6085] builder_t
        | Typedef of [`Typedef_e46ae190d3365bca] builder_t
        | EnumDecl of [`Enum_daecdb4dcd868ea8] builder_t
        | Namespace of [`Namespace_92f4588bb5c5df26] builder_t
        | FunctionTemplate of [`FunctionTemplate_f8e83450e2ea65bc] builder_t
        | ClassTemplate of [`ClassTemplate_e6f1d45b2f7e3f2d] builder_t
        | Undefined of int
      val get : t -> unnamed_union_t
      val union_not_initialized_set : t -> unit
      val ann_set : t -> string -> unit
      val empty_set : t -> unit
      val var_set_reader : t -> [`Var_8da2907bb130c41c] reader_t -> [`Var_8da2907bb130c41c] builder_t
      val var_set_builder : t -> [`Var_8da2907bb130c41c] builder_t -> [`Var_8da2907bb130c41c] builder_t
      val var_init : t -> [`Var_8da2907bb130c41c] builder_t
      val function_set_reader : t -> [`Function_d64c65470b140c81] reader_t -> [`Function_d64c65470b140c81] builder_t
      val function_set_builder : t -> [`Function_d64c65470b140c81] builder_t -> [`Function_d64c65470b140c81] builder_t
      val function_init : t -> [`Function_d64c65470b140c81] builder_t
      val field_set_reader : t -> [`Field_ca43d1968400194b] reader_t -> [`Field_ca43d1968400194b] builder_t
      val field_set_builder : t -> [`Field_ca43d1968400194b] builder_t -> [`Field_ca43d1968400194b] builder_t
      val field_init : t -> [`Field_ca43d1968400194b] builder_t
      val record_set_reader : t -> [`Record_c925b09644ce72d3] reader_t -> [`Record_c925b09644ce72d3] builder_t
      val record_set_builder : t -> [`Record_c925b09644ce72d3] builder_t -> [`Record_c925b09644ce72d3] builder_t
      val record_init : t -> [`Record_c925b09644ce72d3] builder_t
      val method_set_reader : t -> [`Method_bebeef9161eb7d3c] reader_t -> [`Method_bebeef9161eb7d3c] builder_t
      val method_set_builder : t -> [`Method_bebeef9161eb7d3c] builder_t -> [`Method_bebeef9161eb7d3c] builder_t
      val method_init : t -> [`Method_bebeef9161eb7d3c] builder_t
      val access_spec_set : t -> unit
      val ctor_set_reader : t -> [`Ctor_f64598c2842483ec] reader_t -> [`Ctor_f64598c2842483ec] builder_t
      val ctor_set_builder : t -> [`Ctor_f64598c2842483ec] builder_t -> [`Ctor_f64598c2842483ec] builder_t
      val ctor_init : t -> [`Ctor_f64598c2842483ec] builder_t
      val dtor_set_reader : t -> [`Dtor_88d58127ebcf6085] reader_t -> [`Dtor_88d58127ebcf6085] builder_t
      val dtor_set_builder : t -> [`Dtor_88d58127ebcf6085] builder_t -> [`Dtor_88d58127ebcf6085] builder_t
      val dtor_init : t -> [`Dtor_88d58127ebcf6085] builder_t
      val typedef_set_reader : t -> [`Typedef_e46ae190d3365bca] reader_t -> [`Typedef_e46ae190d3365bca] builder_t
      val typedef_set_builder : t -> [`Typedef_e46ae190d3365bca] builder_t -> [`Typedef_e46ae190d3365bca] builder_t
      val typedef_init : t -> [`Typedef_e46ae190d3365bca] builder_t
      val enum_decl_set_reader : t -> [`Enum_daecdb4dcd868ea8] reader_t -> [`Enum_daecdb4dcd868ea8] builder_t
      val enum_decl_set_builder : t -> [`Enum_daecdb4dcd868ea8] builder_t -> [`Enum_daecdb4dcd868ea8] builder_t
      val enum_decl_init : t -> [`Enum_daecdb4dcd868ea8] builder_t
      val namespace_set_reader : t -> [`Namespace_92f4588bb5c5df26] reader_t -> [`Namespace_92f4588bb5c5df26] builder_t
      val namespace_set_builder : t -> [`Namespace_92f4588bb5c5df26] builder_t -> [`Namespace_92f4588bb5c5df26] builder_t
      val namespace_init : t -> [`Namespace_92f4588bb5c5df26] builder_t
      val function_template_set_reader : t -> [`FunctionTemplate_f8e83450e2ea65bc] reader_t -> [`FunctionTemplate_f8e83450e2ea65bc] builder_t
      val function_template_set_builder : t -> [`FunctionTemplate_f8e83450e2ea65bc] builder_t -> [`FunctionTemplate_f8e83450e2ea65bc] builder_t
      val function_template_init : t -> [`FunctionTemplate_f8e83450e2ea65bc] builder_t
      val class_template_set_reader : t -> [`ClassTemplate_e6f1d45b2f7e3f2d] reader_t -> [`ClassTemplate_e6f1d45b2f7e3f2d] builder_t
      val class_template_set_builder : t -> [`ClassTemplate_e6f1d45b2f7e3f2d] builder_t -> [`ClassTemplate_e6f1d45b2f7e3f2d] builder_t
      val class_template_init : t -> [`ClassTemplate_e6f1d45b2f7e3f2d] builder_t
      val of_message : rw message_t -> t
      val to_message : t -> rw message_t
      val to_reader : t -> struct_t reader_t
      val init_root : ?message_size:int -> unit -> t
      val init_pointer : pointer_t -> t
    end
    module UnaryOpKind : sig
      type t = UnaryOpKind_16270584510146119878.t =
        | Plus
        | Minus
        | Not
        | LNot
        | AddrOf
        | Deref
        | PreInc
        | PreDec
        | PostInc
        | PostDec
        | Undefined of int
    end
    module BinaryOpKind : sig
      type t = BinaryOpKind_15775553773985184773.t =
        | Add
        | Sub
        | Assign
        | Mul
        | Div
        | Rem
        | Shl
        | Shr
        | Lt
        | Gt
        | Le
        | Ge
        | Eq
        | Ne
        | And
        | Or
        | Xor
        | LAnd
        | LOr
        | MulAssign
        | DivAssign
        | RemAssign
        | AddAssign
        | SubAssign
        | ShlAssign
        | ShrAssign
        | AndAssign
        | XorAssign
        | OrAssign
        | Undefined of int
    end
    module SufKind : sig
      type t = SufKind_10349718269051794478.t =
        | LSuf
        | LLSuf
        | NoSuf
        | Undefined of int
    end
    module NbBase : sig
      type t = NbBase_15750048951651279863.t =
        | Decimal
        | Octal
        | Hex
        | Undefined of int
    end
    module Expr : sig
      type struct_t = [`Expr_d5d009cc85c86562]
      type t = struct_t builder_t
      module UnaryOp : sig
        type struct_t = [`UnaryOp_b525d86a8f48e679]
        type t = struct_t builder_t
        val has_operand : t -> bool
        val operand_get : t -> Node.t
        val operand_set_reader : t -> Node.struct_t reader_t -> Node.t
        val operand_set_builder : t -> Node.t -> Node.t
        val operand_init : t -> Node.t
        val kind_get : t -> UnaryOpKind.t
        val kind_set : t -> UnaryOpKind.t -> unit
        val kind_set_unsafe : t -> UnaryOpKind.t -> unit
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      module BinaryOp : sig
        type struct_t = [`BinaryOp_b95e9a5df08d277c]
        type t = struct_t builder_t
        val has_lhs : t -> bool
        val lhs_get : t -> Node.t
        val lhs_set_reader : t -> Node.struct_t reader_t -> Node.t
        val lhs_set_builder : t -> Node.t -> Node.t
        val lhs_init : t -> Node.t
        val has_rhs : t -> bool
        val rhs_get : t -> Node.t
        val rhs_set_reader : t -> Node.struct_t reader_t -> Node.t
        val rhs_set_builder : t -> Node.t -> Node.t
        val rhs_init : t -> Node.t
        val kind_get : t -> BinaryOpKind.t
        val kind_set : t -> BinaryOpKind.t -> unit
        val kind_set_unsafe : t -> BinaryOpKind.t -> unit
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      module IntLit : sig
        type struct_t = [`IntLit_a21731ff472a9631]
        type t = struct_t builder_t
        val has_value : t -> bool
        val value_get : t -> string
        val value_set : t -> string -> unit
        val u_suffix_get : t -> bool
        val u_suffix_set : t -> bool -> unit
        val l_suffix_get : t -> SufKind.t
        val l_suffix_set : t -> SufKind.t -> unit
        val l_suffix_set_unsafe : t -> SufKind.t -> unit
        val base_get : t -> NbBase.t
        val base_set : t -> NbBase.t -> unit
        val base_set_unsafe : t -> NbBase.t -> unit
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      module Call : sig
        type struct_t = [`Call_d6c567dfeede9b58]
        type t = struct_t builder_t
        val has_args : t -> bool
        val args_get : t -> (rw, Node.t, array_t) Capnp.Array.t
        val args_get_list : t -> Node.t list
        val args_get_array : t -> Node.t array
        val args_set : t -> (rw, Node.t, array_t) Capnp.Array.t -> (rw, Node.t, array_t) Capnp.Array.t
        val args_set_list : t -> Node.t list -> (rw, Node.t, array_t) Capnp.Array.t
        val args_set_array : t -> Node.t array -> (rw, Node.t, array_t) Capnp.Array.t
        val args_init : t -> int -> (rw, Node.t, array_t) Capnp.Array.t
        val has_callee : t -> bool
        val callee_get : t -> Node.t
        val callee_set_reader : t -> Node.struct_t reader_t -> Node.t
        val callee_set_builder : t -> Node.t -> Node.t
        val callee_init : t -> Node.t
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      module MemberCall : sig
        type struct_t = [`MemberCall_a4d76185fab22f27]
        type t = struct_t builder_t
        val has_implicit_arg : t -> bool
        val implicit_arg_get : t -> Node.t
        val implicit_arg_set_reader : t -> Node.struct_t reader_t -> Node.t
        val implicit_arg_set_builder : t -> Node.t -> Node.t
        val implicit_arg_init : t -> Node.t
        val arrow_get : t -> bool
        val arrow_set : t -> bool -> unit
        val has_call : t -> bool
        val call_get : t -> Call.t
        val call_set_reader : t -> Call.struct_t reader_t -> Call.t
        val call_set_builder : t -> Call.t -> Call.t
        val call_init : t -> Call.t
        val target_has_qualifier_get : t -> bool
        val target_has_qualifier_set : t -> bool -> unit
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      module Member : sig
        type struct_t = [`Member_ab509764d68e7721]
        type t = struct_t builder_t
        val has_base : t -> bool
        val base_get : t -> Node.t
        val base_set_reader : t -> Node.struct_t reader_t -> Node.t
        val base_set_builder : t -> Node.t -> Node.t
        val base_init : t -> Node.t
        val has_name : t -> bool
        val name_get : t -> string
        val name_set : t -> string -> unit
        val arrow_get : t -> bool
        val arrow_set : t -> bool -> unit
        val base_is_pointer_get : t -> bool
        val base_is_pointer_set : t -> bool -> unit
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      module New : sig
        type struct_t = [`New_e0dbc3751d359960]
        type t = struct_t builder_t
        val has_type : t -> bool
        val type_get : t -> Type.t
        val type_set_reader : t -> Type.struct_t reader_t -> Type.t
        val type_set_builder : t -> Type.t -> Type.t
        val type_init : t -> Type.t
        val has_expr : t -> bool
        val expr_get : t -> Node.t
        val expr_set_reader : t -> Node.struct_t reader_t -> Node.t
        val expr_set_builder : t -> Node.t -> Node.t
        val expr_init : t -> Node.t
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      module Construct : sig
        type struct_t = [`Construct_9094c5b59016772f]
        type t = struct_t builder_t
        val has_name : t -> bool
        val name_get : t -> string
        val name_set : t -> string -> unit
        val has_args : t -> bool
        val args_get : t -> (rw, Node.t, array_t) Capnp.Array.t
        val args_get_list : t -> Node.t list
        val args_get_array : t -> Node.t array
        val args_set : t -> (rw, Node.t, array_t) Capnp.Array.t -> (rw, Node.t, array_t) Capnp.Array.t
        val args_set_list : t -> Node.t list -> (rw, Node.t, array_t) Capnp.Array.t
        val args_set_array : t -> Node.t array -> (rw, Node.t, array_t) Capnp.Array.t
        val args_init : t -> int -> (rw, Node.t, array_t) Capnp.Array.t
        val has_type : t -> bool
        val type_get : t -> Type.t
        val type_set_reader : t -> Type.struct_t reader_t -> Type.t
        val type_set_builder : t -> Type.t -> Type.t
        val type_init : t -> Type.t
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      module StructToStruct : sig
        type struct_t = [`StructToStruct_a6587e392992550d]
        type t = struct_t builder_t
        val has_expr : t -> bool
        val expr_get : t -> Node.t
        val expr_set_reader : t -> Node.struct_t reader_t -> Node.t
        val expr_set_builder : t -> Node.t -> Node.t
        val expr_init : t -> Node.t
        val has_type : t -> bool
        val type_get : t -> Type.t
        val type_set_reader : t -> Type.struct_t reader_t -> Type.t
        val type_set_builder : t -> Type.t -> Type.t
        val type_init : t -> Type.t
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      type unnamed_union_t =
        | UnionNotInitialized
        | UnaryOp of [`UnaryOp_b525d86a8f48e679] builder_t
        | BinaryOp of [`BinaryOp_b95e9a5df08d277c] builder_t
        | BoolLit of bool
        | IntLit of [`IntLit_a21731ff472a9631] builder_t
        | StringLit of string
        | Call of [`Call_d6c567dfeede9b58] builder_t
        | DeclRef of string
        | Member of [`Member_ab509764d68e7721] builder_t
        | This
        | MemberCall of [`MemberCall_a4d76185fab22f27] builder_t
        | New of [`New_e0dbc3751d359960] builder_t
        | Construct of [`Construct_9094c5b59016772f] builder_t
        | NullPtrLit
        | Delete of Node.t
        | Truncating of Node.t
        | LValueToRValue of Node.t
        | DerivedToBase of [`StructToStruct_a6587e392992550d] builder_t
        | BaseToDerived of [`StructToStruct_a6587e392992550d] builder_t
        | OperatorCall of [`Call_d6c567dfeede9b58] builder_t
        | Undefined of int
      val get : t -> unnamed_union_t
      val union_not_initialized_set : t -> unit
      val unary_op_set_reader : t -> [`UnaryOp_b525d86a8f48e679] reader_t -> [`UnaryOp_b525d86a8f48e679] builder_t
      val unary_op_set_builder : t -> [`UnaryOp_b525d86a8f48e679] builder_t -> [`UnaryOp_b525d86a8f48e679] builder_t
      val unary_op_init : t -> [`UnaryOp_b525d86a8f48e679] builder_t
      val binary_op_set_reader : t -> [`BinaryOp_b95e9a5df08d277c] reader_t -> [`BinaryOp_b95e9a5df08d277c] builder_t
      val binary_op_set_builder : t -> [`BinaryOp_b95e9a5df08d277c] builder_t -> [`BinaryOp_b95e9a5df08d277c] builder_t
      val binary_op_init : t -> [`BinaryOp_b95e9a5df08d277c] builder_t
      val bool_lit_set : t -> bool -> unit
      val int_lit_set_reader : t -> [`IntLit_a21731ff472a9631] reader_t -> [`IntLit_a21731ff472a9631] builder_t
      val int_lit_set_builder : t -> [`IntLit_a21731ff472a9631] builder_t -> [`IntLit_a21731ff472a9631] builder_t
      val int_lit_init : t -> [`IntLit_a21731ff472a9631] builder_t
      val string_lit_set : t -> string -> unit
      val call_set_reader : t -> [`Call_d6c567dfeede9b58] reader_t -> [`Call_d6c567dfeede9b58] builder_t
      val call_set_builder : t -> [`Call_d6c567dfeede9b58] builder_t -> [`Call_d6c567dfeede9b58] builder_t
      val call_init : t -> [`Call_d6c567dfeede9b58] builder_t
      val decl_ref_set : t -> string -> unit
      val member_set_reader : t -> [`Member_ab509764d68e7721] reader_t -> [`Member_ab509764d68e7721] builder_t
      val member_set_builder : t -> [`Member_ab509764d68e7721] builder_t -> [`Member_ab509764d68e7721] builder_t
      val member_init : t -> [`Member_ab509764d68e7721] builder_t
      val this_set : t -> unit
      val member_call_set_reader : t -> [`MemberCall_a4d76185fab22f27] reader_t -> [`MemberCall_a4d76185fab22f27] builder_t
      val member_call_set_builder : t -> [`MemberCall_a4d76185fab22f27] builder_t -> [`MemberCall_a4d76185fab22f27] builder_t
      val member_call_init : t -> [`MemberCall_a4d76185fab22f27] builder_t
      val new_set_reader : t -> [`New_e0dbc3751d359960] reader_t -> [`New_e0dbc3751d359960] builder_t
      val new_set_builder : t -> [`New_e0dbc3751d359960] builder_t -> [`New_e0dbc3751d359960] builder_t
      val new_init : t -> [`New_e0dbc3751d359960] builder_t
      val construct_set_reader : t -> [`Construct_9094c5b59016772f] reader_t -> [`Construct_9094c5b59016772f] builder_t
      val construct_set_builder : t -> [`Construct_9094c5b59016772f] builder_t -> [`Construct_9094c5b59016772f] builder_t
      val construct_init : t -> [`Construct_9094c5b59016772f] builder_t
      val null_ptr_lit_set : t -> unit
      val delete_set_reader : t -> Node.struct_t reader_t -> Node.t
      val delete_set_builder : t -> Node.t -> Node.t
      val delete_init : t -> Node.t
      val truncating_set_reader : t -> Node.struct_t reader_t -> Node.t
      val truncating_set_builder : t -> Node.t -> Node.t
      val truncating_init : t -> Node.t
      val l_value_to_r_value_set_reader : t -> Node.struct_t reader_t -> Node.t
      val l_value_to_r_value_set_builder : t -> Node.t -> Node.t
      val l_value_to_r_value_init : t -> Node.t
      val derived_to_base_set_reader : t -> [`StructToStruct_a6587e392992550d] reader_t -> [`StructToStruct_a6587e392992550d] builder_t
      val derived_to_base_set_builder : t -> [`StructToStruct_a6587e392992550d] builder_t -> [`StructToStruct_a6587e392992550d] builder_t
      val derived_to_base_init : t -> [`StructToStruct_a6587e392992550d] builder_t
      val base_to_derived_set_reader : t -> [`StructToStruct_a6587e392992550d] reader_t -> [`StructToStruct_a6587e392992550d] builder_t
      val base_to_derived_set_builder : t -> [`StructToStruct_a6587e392992550d] builder_t -> [`StructToStruct_a6587e392992550d] builder_t
      val base_to_derived_init : t -> [`StructToStruct_a6587e392992550d] builder_t
      val operator_call_set_reader : t -> [`Call_d6c567dfeede9b58] reader_t -> [`Call_d6c567dfeede9b58] builder_t
      val operator_call_set_builder : t -> [`Call_d6c567dfeede9b58] builder_t -> [`Call_d6c567dfeede9b58] builder_t
      val operator_call_init : t -> [`Call_d6c567dfeede9b58] builder_t
      val of_message : rw message_t -> t
      val to_message : t -> rw message_t
      val to_reader : t -> struct_t reader_t
      val init_root : ?message_size:int -> unit -> t
      val init_pointer : pointer_t -> t
    end
    module Include : sig
      type struct_t = [`Include_ad2f528afe2c7941]
      type t = struct_t builder_t
      module RealInclude : sig
        type struct_t = [`RealInclude_98b043b3eb527a16]
        type t = struct_t builder_t
        val has_loc : t -> bool
        val loc_get : t -> Loc.t
        val loc_set_reader : t -> Loc.struct_t reader_t -> Loc.t
        val loc_set_builder : t -> Loc.t -> Loc.t
        val loc_init : t -> Loc.t
        val has_file_name : t -> bool
        val file_name_get : t -> string
        val file_name_set : t -> string -> unit
        val fd_get : t -> int
        val fd_set_exn : t -> int -> unit
        val has_includes : t -> bool
        val includes_get : t -> (rw, [`Include_ad2f528afe2c7941] builder_t, array_t) Capnp.Array.t
        val includes_get_list : t -> [`Include_ad2f528afe2c7941] builder_t list
        val includes_get_array : t -> [`Include_ad2f528afe2c7941] builder_t array
        val includes_set : t -> (rw, [`Include_ad2f528afe2c7941] builder_t, array_t) Capnp.Array.t -> (rw, [`Include_ad2f528afe2c7941] builder_t, array_t) Capnp.Array.t
        val includes_set_list : t -> [`Include_ad2f528afe2c7941] builder_t list -> (rw, [`Include_ad2f528afe2c7941] builder_t, array_t) Capnp.Array.t
        val includes_set_array : t -> [`Include_ad2f528afe2c7941] builder_t array -> (rw, [`Include_ad2f528afe2c7941] builder_t, array_t) Capnp.Array.t
        val includes_init : t -> int -> (rw, [`Include_ad2f528afe2c7941] builder_t, array_t) Capnp.Array.t
        val is_angled_get : t -> bool
        val is_angled_set : t -> bool -> unit
        val of_message : rw message_t -> t
        val to_message : t -> rw message_t
        val to_reader : t -> struct_t reader_t
        val init_root : ?message_size:int -> unit -> t
        val init_pointer : pointer_t -> t
      end
      type unnamed_union_t =
        | UnionNotInitialized
        | RealInclude of [`RealInclude_98b043b3eb527a16] builder_t
        | GhostInclude of Clause.t
        | Undefined of int
      val get : t -> unnamed_union_t
      val union_not_initialized_set : t -> unit
      val real_include_set_reader : t -> [`RealInclude_98b043b3eb527a16] reader_t -> [`RealInclude_98b043b3eb527a16] builder_t
      val real_include_set_builder : t -> [`RealInclude_98b043b3eb527a16] builder_t -> [`RealInclude_98b043b3eb527a16] builder_t
      val real_include_init : t -> [`RealInclude_98b043b3eb527a16] builder_t
      val ghost_include_set_reader : t -> Clause.struct_t reader_t -> Clause.t
      val ghost_include_set_builder : t -> Clause.t -> Clause.t
      val ghost_include_init : t -> Clause.t
      val of_message : rw message_t -> t
      val to_message : t -> rw message_t
      val to_reader : t -> struct_t reader_t
      val init_root : ?message_size:int -> unit -> t
      val init_pointer : pointer_t -> t
    end
    module File : sig
      type struct_t = [`File_8ae30723c7f4eeb7]
      type t = struct_t builder_t
      val fd_get : t -> int
      val fd_set_exn : t -> int -> unit
      val has_path : t -> bool
      val path_get : t -> string
      val path_set : t -> string -> unit
      val has_decls : t -> bool
      val decls_get : t -> (rw, Node.t, array_t) Capnp.Array.t
      val decls_get_list : t -> Node.t list
      val decls_get_array : t -> Node.t array
      val decls_set : t -> (rw, Node.t, array_t) Capnp.Array.t -> (rw, Node.t, array_t) Capnp.Array.t
      val decls_set_list : t -> Node.t list -> (rw, Node.t, array_t) Capnp.Array.t
      val decls_set_array : t -> Node.t array -> (rw, Node.t, array_t) Capnp.Array.t
      val decls_init : t -> int -> (rw, Node.t, array_t) Capnp.Array.t
      val of_message : rw message_t -> t
      val to_message : t -> rw message_t
      val to_reader : t -> struct_t reader_t
      val init_root : ?message_size:int -> unit -> t
      val init_pointer : pointer_t -> t
    end
    module TU : sig
      type struct_t = [`TU_c63033d95787d2ff]
      type t = struct_t builder_t
      val main_fd_get : t -> int
      val main_fd_set_exn : t -> int -> unit
      val has_includes : t -> bool
      val includes_get : t -> (rw, Include.t, array_t) Capnp.Array.t
      val includes_get_list : t -> Include.t list
      val includes_get_array : t -> Include.t array
      val includes_set : t -> (rw, Include.t, array_t) Capnp.Array.t -> (rw, Include.t, array_t) Capnp.Array.t
      val includes_set_list : t -> Include.t list -> (rw, Include.t, array_t) Capnp.Array.t
      val includes_set_array : t -> Include.t array -> (rw, Include.t, array_t) Capnp.Array.t
      val includes_init : t -> int -> (rw, Include.t, array_t) Capnp.Array.t
      val has_files : t -> bool
      val files_get : t -> (rw, File.t, array_t) Capnp.Array.t
      val files_get_list : t -> File.t list
      val files_get_array : t -> File.t array
      val files_set : t -> (rw, File.t, array_t) Capnp.Array.t -> (rw, File.t, array_t) Capnp.Array.t
      val files_set_list : t -> File.t list -> (rw, File.t, array_t) Capnp.Array.t
      val files_set_array : t -> File.t array -> (rw, File.t, array_t) Capnp.Array.t
      val files_init : t -> int -> (rw, File.t, array_t) Capnp.Array.t
      val has_fail_directives : t -> bool
      val fail_directives_get : t -> (rw, Clause.t, array_t) Capnp.Array.t
      val fail_directives_get_list : t -> Clause.t list
      val fail_directives_get_array : t -> Clause.t array
      val fail_directives_set : t -> (rw, Clause.t, array_t) Capnp.Array.t -> (rw, Clause.t, array_t) Capnp.Array.t
      val fail_directives_set_list : t -> Clause.t list -> (rw, Clause.t, array_t) Capnp.Array.t
      val fail_directives_set_array : t -> Clause.t array -> (rw, Clause.t, array_t) Capnp.Array.t
      val fail_directives_init : t -> int -> (rw, Clause.t, array_t) Capnp.Array.t
      val of_message : rw message_t -> t
      val to_message : t -> rw message_t
      val to_reader : t -> struct_t reader_t
      val init_root : ?message_size:int -> unit -> t
      val init_pointer : pointer_t -> t
    end
    module Err : sig
      type struct_t = [`Err_9162b284a3cba818]
      type t = struct_t builder_t
      val has_loc : t -> bool
      val loc_get : t -> Loc.t
      val loc_set_reader : t -> Loc.struct_t reader_t -> Loc.t
      val loc_set_builder : t -> Loc.t -> Loc.t
      val loc_init : t -> Loc.t
      val has_reason : t -> bool
      val reason_get : t -> string
      val reason_set : t -> string -> unit
      val of_message : rw message_t -> t
      val to_message : t -> rw message_t
      val to_reader : t -> struct_t reader_t
      val init_root : ?message_size:int -> unit -> t
      val init_pointer : pointer_t -> t
    end
    module VfError : sig
      type struct_t = [`VfError_a924c04c2f68f445]
      type t = struct_t builder_t
      val has_tu : t -> bool
      val tu_get : t -> TU.t
      val tu_set_reader : t -> TU.struct_t reader_t -> TU.t
      val tu_set_builder : t -> TU.t -> TU.t
      val tu_init : t -> TU.t
      val has_errors : t -> bool
      val errors_get : t -> (rw, Err.t, array_t) Capnp.Array.t
      val errors_get_list : t -> Err.t list
      val errors_get_array : t -> Err.t array
      val errors_set : t -> (rw, Err.t, array_t) Capnp.Array.t -> (rw, Err.t, array_t) Capnp.Array.t
      val errors_set_list : t -> Err.t list -> (rw, Err.t, array_t) Capnp.Array.t
      val errors_set_array : t -> Err.t array -> (rw, Err.t, array_t) Capnp.Array.t
      val errors_init : t -> int -> (rw, Err.t, array_t) Capnp.Array.t
      val of_message : rw message_t -> t
      val to_message : t -> rw message_t
      val to_reader : t -> struct_t reader_t
      val init_root : ?message_size:int -> unit -> t
      val init_pointer : pointer_t -> t
    end
    module SerResult : sig
      type struct_t = [`SerResult_a5cc2b3709c2654d]
      type t = struct_t builder_t
      type unnamed_union_t =
        | Ok of TU.t
        | ClangError
        | VfError of VfError.t
        | Undefined of int
      val get : t -> unnamed_union_t
      val ok_set_reader : t -> TU.struct_t reader_t -> TU.t
      val ok_set_builder : t -> TU.t -> TU.t
      val ok_init : t -> TU.t
      val clang_error_set : t -> unit
      val vf_error_set_reader : t -> VfError.struct_t reader_t -> VfError.t
      val vf_error_set_builder : t -> VfError.t -> VfError.t
      val vf_error_init : t -> VfError.t
      val of_message : rw message_t -> t
      val to_message : t -> rw message_t
      val to_reader : t -> struct_t reader_t
      val init_root : ?message_size:int -> unit -> t
      val init_pointer : pointer_t -> t
    end
  end
end

module MakeRPC(MessageWrapper : Capnp.RPC.S) : sig
  include S with module MessageWrapper = MessageWrapper

  module Client : sig
  end

  module Service : sig
  end
end

module Make(M : Capnp.MessageSig.S) : module type of MakeRPC(Capnp.RPC.None(M))
