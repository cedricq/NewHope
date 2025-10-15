INCLUDE(CMakeForceCompiler)

# define the OS target that CMake is building for
SET(CMAKE_SYSTEM_NAME GNU)

string (REPLACE "\\" "/" ENV_GCC_CYGWIN_PATH $ENV{ENV_GCC_CYGWIN})

# specify the cross compiler
CMAKE_FORCE_C_COMPILER (${ENV_GCC_CYGWIN_PATH}/bin/gcc.exe GNU)
CMAKE_FORCE_CXX_COMPILER (${ENV_GCC_CYGWIN_PATH}/bin/g++.exe GNU)

set(CFLAGS "-Wall -Werror")

set(CMAKE_C_FLAGS           "${CMAKE_C_FLAGS} ${CFLAGS}")
set(CMAKE_C_FLAGS_DEBUG     "-Og -g3")
set(CMAKE_C_FLAGS_RELEASE   "-Os")
#
#set(CMAKE_CXX_FLAGS         "${CMAKE_CXX_FLAGS} ${CFLAGS} -fno-rtti -fno-exceptions -std=c++11")
#set(CMAKE_CXX_FLAGS_DEBUG   "${CMAKE_C_FLAGS_DEBUG}")
#set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE}")