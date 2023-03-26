.PHONY: build clean

build: *.cpp *.h ../stubs/cxx_stubs_ast.capnp.h ../stubs/cxx_stubs_ast.capnp.c++
	cmake --build build

../stubs/cxx_stubs_ast.capnp.h ../stubs/cxx_stubs_ast.capnp.c++ &: ../stubs/cxx_stubs_ast.capnp
	dune build @gen_cxx_stubs_cxx --profile release

clean:
	cmake --build build --target clean