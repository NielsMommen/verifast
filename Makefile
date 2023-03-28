.PHONY: all build build-vf-cxx-ast-exporter test clean help

all: build test

export NOZ3						?= false
export Z3V4DOT5					?= true

ifdef VERBOSE
	DUNE_OPTIONS += --verbose
endif

help:
	@echo "Builds verifast, vfide, mysh, ... but not the dependencies."
	@echo "It does not build Z3 bindings, lablgtk bindings, ocaml, ..."
	@echo "Usage: "
	@echo "  make help : print this help"
	@echo "  TODO"

build: build-vf-cxx-ast-exporter
	dune build --profile release $(DUNE_OPTIONS)

build-vf-cxx-ast-exporter:
	make -C src/cxx_frontend/ast_exporter build

test:
	dune runtest

clean:
	dune clean
	make -C src/cxx_frontend/ast_exporter clean
	rm -f bin/*