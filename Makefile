.PHONY: all dune-build build build-vf-cxx-ast-exporter vfide verifast test dune-test testsuite assignment_tests java_frontend_test dune-clean clean help

all: build test

#------------------------#
#-------- config --------#
#------------------------#

# macosx | linux | mingw
OS = $(shell ocamlc -config-var system)

ifeq ($(OS),mingw)
DOTEXE=.exe
DOTDLL=.dll
else ifeq ($(OS),linux)
DOTDLL=.so
else ifeq ($(OS),macosx)
DOTDLL=.dylib
else
	$(error "Could recognise your platform")
endif

ifdef VERBOSE
DUNE_OPTIONS += --verbose
else
.SILENT:
endif

# It's Z3 when installed using `make install` and z3 when installed using OPAM
Z3_OCAML ?= $(shell ocamlfind query -qe Z3)
ifeq ($(Z3_OCAML),)
Z3_DLL_DIR ?= $(shell ocamlc -config-var standard-library)/..
else
Z3_DLL_DIR ?= $(Z3_OCAML)/../..
endif

# export config
export

#------------------------#
#-------- stdlib --------#
#------------------------#

STDLIB = bin/crt.dll.vfmanifest
#sequence is important, it presents dependencies in command line of VeriFast
STDLIB_FILES_GEN = \
       bin/list.vfmanifest \
       bin/listex.vfmanifest \
       bin/raw_ghost_lists.vfmanifest \
       bin/strong_ghost_lists.vfmanifest \
       bin/arrays.vfmanifest \
       bin/quantifiers.vfmanifest \
       bin/assoclist.vfmanifest \
       bin/bitops.vfmanifest \
       bin/permutations.vfmanifest
STDLIB_FILES = \
	bin/crt.vfmanifest \
	$(STDLIB_FILES_GEN)

# We have " || rm ..." such that in case verifast fails, we do not end
# up with an empty (and thus incorrect) .dll.vfmanifest file.
# We have "> $(STDLIB)" for bootstrapping the standard library: the
# .dll.vfmanifest gets loaded when creating .dll.vfmanifest, so it must
# be empty.
$(STDLIB): $(STDLIB_FILES)
	@echo "  >        " $@
	> $(STDLIB)
	@echo "  VERIFAST " $@
	bin/verifast$(DOTEXE) -shared $(STDLIB_FILES) -emit_dll_vfmanifest \
	-emit_dll_vfmanifest_as $@  || (rm -f $(STDLIB) ; false)

bin/%.vfmanifest: bin/%.c bin/%.gh bin/verifast$(DOTEXE)
	bin/verifast -c -emit_vfmanifest bin/$*.c

bin/bitops.vfmanifest: bin/bitops.c bin/bitops.gh bin/verifast$(DOTEXE)
	bin/verifast -c -prover z3v4.5 -emit_vfmanifest bin/bitops.c

clean::
	rm -f $(STDLIB)
	rm -f $(STDLIB_FILES_GEN)

#------------------------#
#-------- libs ----------#
#------------------------#

bin/libz3.%: $(Z3_DLL_DIR)/libz3.%
	cp -f $< $@

clean::
	rm -f bin/*.so bin/*.dll
	rm -f lib/*.dylib

lib/libgtksourceview-2.0.0.dylib:
	mkdir -p lib
	for i in $$( cat vfide-osx-local-dlls.txt ); do cp $$i lib; done
	mkdir -p lib/gdk-pixbuf-2.0/2.10.0
	echo > lib/gdk-pixbuf-2.0/2.10.0/loaders.cache

#------------------------#
#-------- tools ---------#
#------------------------#

DUNE_BUILD_BIN_DIR = _build/install/default/bin

.SECONDEXPANSION:
bin/mysh$(DOTEXE) bin/main_class$(DOTEXE) bin/java_card_applet$(DOTEXE) bin/dlsymtool$(DOTEXE) bin/vfstrip$(DOTEXE): $(DUNE_BUILD_BIN_DIR)/$$(@F)
	cp -f $< $@

.SECONDEXPANSION:
bin/verifast$(DOTEXE) bin/explorer$(DOTEXE): $(DUNE_BUILD_BIN_DIR)/$$(@F) bin/libz3$(DOTDLL)
	cp -f $< $@
ifeq ($(OS),macosx)
	install_name_tool -change libz3.dylib @loader_path/libz3.dylib $@
endif

ifeq ($(OS),macosx)
bin/vfide$(DOTEXE): lib/libgtksourceview-2.0.0.dylib
endif
bin/vfide$(DOTEXE): $(DUNE_BUILD_BIN_DIR)/vfide$(DOTEXE) bin/libz3$(DOTDLL)
	cp -f $< $@
ifeq ($(OS),macosx)
	install_name_tool -change libz3.dylib @loader_path/libz3.dylib $@
	DYLD_PRINT_LIBRARIES=1 $@ -verify_and_quit examples/busywaiting/ioliveness/echo_live_mt.c > vfide-libraries.log 2>&1
	! grep /usr/local vfide-libraries.log
endif

AST_EXPORTER_SRC_DIR = src/cxx_frontend/ast_exporter

bin/vf-cxx-ast-exporter$(DOTEXE): $(AST_EXPORTER_SRC_DIR)/build/vf-cxx-ast-exporter$(DOTEXE)
	cp -f $< $@

$(AST_EXPORTER_SRC_DIR)/build/vf-cxx-ast-exporter$(DOTEXE):
	cmake --build $(AST_EXPORTER_SRC_DIR)/build

clean::
	cmake --build $(AST_EXPORTER_SRC_DIR)/build --target clean

DUNE_BUILT_TOOLS = mysh verifast main_class java_card_applet dlsymtool vfstrip explorer vfide
DUNE_BUILT_TOOLS_BINARIES = $(addsuffix $(DOTEXE),$(addprefix $(DUNE_BUILD_BIN_DIR)/,$(DUNE_BUILT_TOOLS)))

$(DUNE_BUILT_TOOLS_BINARIES) &: dune-build

TOOLS = $(addsuffix $(DOTEXE),$(addprefix bin/,$(DUNE_BUILT_TOOLS) vf-cxx-ast-exporter))

build-vf-cxx-ast-exporter: bin/vf-cxx-ast-exporter$(DOTEXE)

dune-build:
	dune build --profile release $(DUNE_OPTIONS)

clean::
	rm -f $(TOOLS)

#------------------------#
#-------- tests ---------#
#------------------------#

ifeq ($(OS),macosx)
NUMCPU ?= $(shell sysctl -n hw.ncpu)
else
# Works on Linux and Cygwin (Cygwin has no /sys).
NUMCPU ?= $(shell cat /proc/cpuinfo | grep 'processor' | wc -l)
endif

testsuite: $(STDLIB) $(TOOLS)
	dune build @src/json/runtest --profile release $(DUNE_OPTIONS)
	@echo "  MYSH     " testsuite
	export PATH=$(CURDIR)/bin:$(PATH); bin/mysh -cpus $(NUMCPU) < testsuite.mysh

assignment_tests: $(STDLIB) $(TOOLS_EXCEPT_VFIDE)
	@echo "  MYSH     " assignments/run_model_solutions
	export PATH=$(CURDIR)/bin:$(PATH); \
        if [ -d assignments ]; then cd assignments; bin/mysh -cpus $(NUMCPU) < run_model_solutions.mysh; fi

dune-test:
	dune runtest

# Do not run the test targets in parallel because of GNU Make bug:
# If one of the parallel targets fails, make prints an error
# before the others stop. The other targets print (long) output after
# this error message. The user does not see the error and thinks
# the tests passed. (someone reported this years ago here:
# https://lists.gnu.org/archive/html/bug-make/2010-09/msg00033.html)
# So we serialize the test targets.
test: testsuite assignment_tests dune-test
testsuite: assignment_tests # dependency to enforce serialization

ifdef VERIFAST_JAVA_AST_SERVER
java_frontend_test: $(STDLIB) $(TOOLS)
	@echo "  MYSH     " examples/java/frontend/frontend
	export PATH=$(CURDIR)/bin:$(PATH); \
	cd examples/java/frontend; ../../bin/mysh -cpus $(NUMCPU) < frontend.mysh
test: java_frontend_test

assignment_test: java_frontend_tests # dependency to enforce serialization
endif

# Not all tests manage to always clean up (usually when interrupted),
# and not all tests provide a "make clean" themselves. So we clean here.
clean:: cleantest
cleantest::
	@echo "  CLEANTEST"
	rm -f examples/crypto/bin/cryptolib.dll.vfmanifest
	rm -f examples/java/chat/Member_.java
	rm -f examples/java/chat/chat_provide0.java
	rm -f examples/java/chat/chat_provide0_*.java
	rm -f examples/reduced_annotations/c_language/partially_annotated2.dll.vfmanifest
	rm -f examples/true
	rm -f examples/tso/cvm0_.c
	rm -f examples/tso/cvm0__.c
	rm -f examples/BeepDriver/BeepDriver_proxy.c
	rm -f examples/BeepDriver/BeepDriver_proxy.h
	rm -f examples/BeepDriver/BeepDriver_proxy.vfmanifest
	rm -f examples/a.out
	rm -f examples/java/Iterator/prog_provide0_*.java
	rm -f examples/java/"Java Card"/Addressbook_provide0_*.java
	rm -f examples/java/"Java Card"/Echo_provide0_*.java
	rm -f examples/java/"Java Card"/JavaCard_provide0_*.java
	rm -f examples/java/"Java Card"/NewEPurse/NewEPurseApplet_provide0_*.java
	rm -f examples/java/"Java Card"/NewJTicket/NewJTicketApplet_provide0_*.java
	rm -f examples/java/"Java Card"/Store_provide0_*.java
	rm -f examples/java/"Java Card"/shareable-applets/wallet_provide0_*.java
	rm -f examples/java/chatbot/Bot_provide0_*.java
	# Needs to be shipped, they are autogenerated with an ocaml script
	# and we do not want to depend on ocaml just to run the testsuite.
	#rm -f examples/helloproc/*autogenerated*
	rm -f examples/MockKernel/MockKernelModule_proxy*
	rm -f examples/java/"Java Card"/NewEidCard/EidCard-with-auto_provide0_*.java
	rm -f examples/java/"Java Card"/NewEidCard/EidCard_provide0_*.java

#------------------------#
#-------- release -------#
#------------------------#

VFVERSION ?= $(shell git describe --always --dirty)
export VFVERSION

release: release_core
release_core: test build
	rm -Rf verifast-$(VFVERSION); mkdir verifast-$(VFVERSION)
	strip bin/vf-cxx-ast-exporter$(DOTEXE)
	cp -R bin verifast-$(VFVERSION)
ifeq ($(OS), Windows_NT)
	cd $(GTK)/bin && cp -v \
    FREETYPE6.DLL \
    INTL.DLL \
    LIBATK-1.0-0.DLL \
    LIBCAIRO-2.DLL \
    LIBEXPAT-1.DLL \
    LIBFONTCONFIG-1.DLL \
    LIBGDK-WIN32-2.0-0.DLL \
    LIBGDK_PIXBUF-2.0-0.DLL \
    LIBGIO-2.0-0.DLL \
    LIBGLIB-2.0-0.DLL \
    LIBGMODULE-2.0-0.DLL \
    LIBGOBJECT-2.0-0.DLL \
    LIBGTHREAD-2.0-0.DLL \
    LIBGTK-WIN32-2.0-0.DLL \
    LIBGTKSOURCEVIEW-2.0-0.DLL \
    LIBPANGO-1.0-0.DLL \
    LIBPANGOCAIRO-1.0-0.DLL \
    LIBPANGOFT2-1.0-0.DLL \
    LIBPANGOWIN32-1.0-0.DLL \
    LIBPNG14-14.DLL \
    LIBXML2-2.DLL \
    ZLIB1.DLL \
    $(CURDIR)/verifast-$(VFVERSION)/bin
	cd verifast-$(VFVERSION) && \
	mkdir etc && \
	cd etc && \
	mkdir gtk-2.0 && \
	cd gtk-2.0 && \
	echo "" > gdk-pixbuf.loaders && \
	echo 'gtk-theme-name = "MS-Windows"' > gtkrc && \
	cd .. && \
	cd .. && \
	mkdir -p share/themes/MS-Windows/gtk-2.0 && \
	cd share/themes/MS-Windows/gtk-2.0 && \
	cp $(GTK)/share/themes/MS-Windows/gtk-2.0/gtkrc . && \
	cd ../../../.. && \
	mkdir -p lib/gtk-2.0/2.10.0/engines && \
	cp $(GTK)/lib/gtk-2.0/2.10.0/engines/libwimp.dll lib/gtk-2.0/2.10.0/engines
endif
ifeq ($(OS), Linux)
	cp /usr/lib/x86_64-linux-gnu/libgtksourceview-2.0.so.0.0.0 verifast-$(VFVERSION)/bin/libgtksourceview-2.0.so.0
endif
ifeq ($(OS), Darwin)
	cd verifast-$(VFVERSION)/bin; mv vfide vfide-core
	cp vfide-mac.sh verifast-$(VFVERSION)/bin/vfide
	cp -R lib verifast-$(VFVERSION)
endif
	cp -R examples verifast-$(VFVERSION)
	cp -R help verifast-$(VFVERSION)
	cp -R javacard_tutorial verifast-$(VFVERSION)
	cp -R tests verifast-$(VFVERSION)
	cp -R tutorial_solutions verifast-$(VFVERSION)
	mkdir verifast-$(VFVERSION)/tutorial
	cd verifast-$(VFVERSION)/tutorial_solutions; for f in *.c; do bin/vfstrip < $$f > tutorial/$$f; done; cd ..
	cp testsuite.mysh verifast-$(VFVERSION)
	echo "$(VFVERSION)" > verifast-$(VFVERSION)/bin/VERSION
	echo "$(VFVERSION) (released $(shell date +%Y-%m-%d))" >> verifast-$(VFVERSION)/bin/VERSION
ifeq ($(OS), Windows_NT)
	cp test.bat verifast-$(VFVERSION)
else
	cp test.sh verifast-$(VFVERSION)
endif

ifeq ($(OS), Darwin)
  RELEASE_SUFFIX=-osx
else
  RELEASE_SUFFIX=
endif

nightly: release
ifeq ($(OS), mingw)
	printf "SHA-224 of release contents: "; cd verifast-$(VFVERSION); find . -type f ! -path ./bin/VERSION -print0 | sort -z | xargs -0 sha224sum | sha224sum
	rm verifast-nightly.zip || true
	7z a verifast-nightly.zip verifast-$(VFVERSION)
	ls -l verifast-nightly.zip
	sha224sum verifast-nightly.zip
else
	printf "SHA-224 of release contents: "; cd verifast-$(VFVERSION); find . -type f ! -path ./bin/VERSION -print0 | sort -z | xargs -0 shasum -a 224 | shasum -a 224
	rm -Rf ../upload || true
	mkdir ../upload || true
	tar czf ../upload/verifast-nightly$(RELEASE_SUFFIX).tar.gz verifast-$(VFVERSION)
	ls -l ../upload/verifast-nightly$(RELEASE_SUFFIX).tar.gz
	shasum -a 224 ../upload/verifast-nightly$(RELEASE_SUFFIX).tar.gz
endif
ifdef GITHUB_ENV
	echo "VFVERSION=$(VFVERSION)" >> $$GITHUB_ENV
	echo "VERIFAST_OS=$(OS)" >> $$GITHUB_ENV
endif

help:
	@echo "Builds verifast, vfide, mysh, ... but not the dependencies."
	@echo "It does not build Z3 bindings, lablgtk bindings, ocaml, ..."
	@echo "Usage: "
	@echo "  make help : print this help"
	@echo "  TODO"

dune-clean:
	dune clean

clean:: dune-clean

build: dune-build $(TOOLS) $(STDLIB)