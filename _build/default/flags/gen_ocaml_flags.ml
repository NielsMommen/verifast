module C = Configurator.V1
open Vfconfig

let ocaml_cflags =
  match platform with
  | MacOS -> ["-runtime-variant"; "_pic"]
  | _ -> []

let ocaml_lflags =
  match platform with
  | MacOS -> ["-Wl,-headerpad_max_install_names"; "-Wl,-rpath,@loader_path"]
  | Linux -> ["-Wl,-rpath,$ORIGIN"]
  | _ -> []

let prepend_cclib_flag flags =
  let rec iter acc flags =
    match flags with
    | [] -> acc
    | f :: flags -> iter ("-cclib" :: f :: acc) flags
  in
  flags |> List.rev |> iter []

let () =
  C.main ~name:"gen_ocaml_flags" @@ fun _ ->
  let ocaml_lflags = ocaml_lflags |> prepend_cclib_flag in
  C.Flags.write_sexp "ocaml_flags.sexp" (ocaml_cflags @ ocaml_lflags)