.PHONY: build build-vf-cxx-ast-exporter test clean

export NOZ3						?= false
export Z3V4DOT5					?= true

build: build-vf-cxx-ast-exporter
	dune build --profile release --verbose

build-vf-cxx-ast-exporter:
	make -C src/cxx_frontend/ast_exporter build

test:
	dune runtest

clean:
	dune clean
	make -C src/cxx_frontend/ast_exporter clean
	rm -f bin/*