.PHONY: build clean

build: ast_exporter/*.cpp ast_exporter/*.h stubs/cxx_stubs_ast.capnp.h stubs/cxx_stubs_ast.capnp.c++
	cmake --build ast_exporter/build

stubs/cxx_stubs_ast.capnp.h stubs/cxx_stubs_ast.capnp.c++ &: stubs/cxx_stubs_ast.capnp
	dune build @gen_cxx_stubs_cxx --profile release

clean:
	cmake --build ast_exporter/build --target clean