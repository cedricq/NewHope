INCLUDE(CMakeForceCompiler)

# define the OS target that CMake is building for
SET(CMAKE_SYSTEM_NAME ARMCC)

string (REPLACE "\\" "/" ENV_GCC_ARM_PATH $ENV{ENV_GCC_ARM})

# specify the cross compiler
CMAKE_FORCE_C_COMPILER (${ENV_GCC_ARM_PATH}/bin/arm-atollic-eabi-gcc.exe ARMCC)
CMAKE_FORCE_CXX_COMPILER (${ENV_GCC_ARM_PATH}/bin/arm-atollic-eabi-g++.exe ARMCC)

set(CFLAGS "-flto -Wall -Wextra -Wpedantic -Werror -mthumb -mcpu=cortex-m4 -fmessage-length=0")

set(CMAKE_C_FLAGS           "${CMAKE_C_FLAGS} ${CFLAGS} -ffunction-sections -fdata-sections -fno-builtin")
set(CMAKE_C_FLAGS_DEBUG     "-Og -g3")
set(CMAKE_C_FLAGS_RELEASE   "-Os")

set(CMAKE_CXX_FLAGS         "${CMAKE_CXX_FLAGS} ${CFLAGS} -fno-threadsafe-statics -ffunction-sections -fdata-sections -fno-builtin -fno-rtti -std=c++11")
set(CMAKE_CXX_FLAGS_DEBUG   "${CMAKE_C_FLAGS_DEBUG}")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE}")

set(CMAKE_EXE_LINKER_FLAGS  "--specs=nano.specs -mthumb -mcpu=cortex-m4 -lstdc++ -mfloat-abi=hard -Wl -Map=linker.map -Wl,-cref -Wl,--gc-sections -Wl,--defsym=malloc_getpagesize_P=0x1000")
