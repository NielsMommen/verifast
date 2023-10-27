set(CAPNP_PREFIX ${CMAKE_CURRENT_SOURCE_DIR})
set(CAPNP_VFDEPS ${VFDEPS}/include)

if(${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
  find_program(CYGPATH cygpath REQUIRED)
  execute_process(COMMAND ${CYGPATH} -w ${CAPNP_PREFIX} OUTPUT_VARIABLE CAPNP_PREFIX OUTPUT_STRIP_TRAILING_WHITESPACE)
  execute_process(COMMAND ${CYGPATH} -w ${CAPNP_VFDEPS} OUTPUT_VARIABLE CAPNP_VFDEPS OUTPUT_STRIP_TRAILING_WHITESPACE)
endif()

# generated cource and header file for 'stubs_ast' in build directory
add_custom_command(
  OUTPUT stubs_ast.capnp.c++ stubs_ast.capnp.h
  COMMAND capnp compile -I ${CAPNP_VFDEPS} -o c++ ${CAPNP_PREFIX}/stubs_ast.capnp --src-prefix=${CAPNP_PREFIX}
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