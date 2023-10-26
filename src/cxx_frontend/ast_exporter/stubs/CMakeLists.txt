# generated cource and header file for 'stubs_ast' in build directory
add_custom_command(
  OUTPUT stubs_ast.capnp.c++ stubs_ast.capnp.h
  COMMAND capnp compile -o c++ ${CMAKE_CURRENT_SOURCE_DIR}/stubs_ast.capnp --src-prefix=${CMAKE_CURRENT_SOURCE_DIR}
  DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/stubs_ast.capnp
  VERBATIM
)

add_library(
  Stubs_AST
  stubs_ast.capnp.c++
)

target_include_directories(
  Stubs_AST
  PRIVATE
  ${VFDEPS}/include
)

set_property(
  TARGET Stubs_AST
  PROPERTY CXX_STANDARD 17
)