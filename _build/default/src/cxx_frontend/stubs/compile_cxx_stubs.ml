module C = Configurator.V1
open Platform

type lang =
  | OCaml
  | Cxx
  | Unknown

let cygpath c ~path =
  C.Process.run_capture_exn c "cygpath" ["-w"; path]

let resolve_path c ~path =
  match C.ocaml_config_var_exn c "system" |> platform_of_system_string with
  | Windows -> cygpath c ~path
  | _ -> path

let gen_ml_stubs c ~capnp_include dir =
  C.Process.run_ok c "capnp" ["compile"; "-I"; capnp_include; "-o"; "ocaml:" ^ dir; "cxx_stubs_ast.capnp"]

let gen_cxx_stubs c ~capnp_include dir =
  C.Process.run_ok c "capnp" ["compile"; "-I"; capnp_include; "-o"; "c++:" ^ dir; "cxx_stubs_ast.capnp"]

let () =
  let output_lang = ref Unknown in
  let output_dir = ref "." in
  let args = [
    ("-ocaml", Arg.Unit (fun () -> output_lang := OCaml), "");
    ("-c++", Arg.Unit (fun () -> output_lang := Cxx), "");
    ("-dir", Arg.Set_string output_dir, "");
  ] 
  in
  C.main ~args ~name:"compile_cxx_stubs" (fun c ->
    match !output_lang with Unknown -> C.die "Specify a language." | _ -> ();
    let capnp_bin_dir =
      match C.which c "capnp" with
      | None -> C.die "Unable to find 'capnp' binary."
      | Some capnp -> Filename.dirname capnp
    in
    let capnp_include = resolve_path c ~path:(Filename.concat capnp_bin_dir @@ Filename.concat Filename.parent_dir_name "include") in
    match !output_lang, gen_ml_stubs c ~capnp_include !output_dir with
    | OCaml, false -> C.die "Unable to generate ml stubs."
    | _ -> ();
    match !output_lang, gen_cxx_stubs c ~capnp_include !output_dir with
    | Cxx, false -> C.die "Unable to generate c++ stubs."
    | _ -> ()
  )