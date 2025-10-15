cmake_minimum_required(VERSION 3.1)

if(${APPLICATION} STREQUAL DEVICE_F4_DEBUG)

    include(${CMAKE_SOURCE_DIR}/Configuration/GNUArmEmbeddedToolChain.cmake)
    add_subdirectory(${CMAKE_SOURCE_DIR}/Target/STM32F4)

elseif (${APPLICATION} STREQUAL DEVICE_F4_RELEASE)

    include(${CMAKE_SOURCE_DIR}/Configuration/GNUArmEmbeddedToolChain.cmake)
    add_subdirectory(${CMAKE_SOURCE_DIR}/Target/STM32F4)

elseif (${APPLICATION} STREQUAL WINDOWS)

    include(${CMAKE_SOURCE_DIR}/Configuration/GNUWindowsToolChain.cmake)

    add_subdirectory(${CMAKE_SOURCE_DIR}/Target/Windows)

    if (UNITTEST)
        add_subdirectory(${CMAKE_SOURCE_DIR}/TestFramework/googlemock)   
    endif()    
     
endif()

# C et CXX correspondent aux langages pour lesquels CMake cherche un compilateur pour l'ensemble du projet (Cxx = C++)
project(NewHope C CXX)
  
# Enabling ctest
enable_testing()
  
# Code sources des composants
add_subdirectory(${CMAKE_SOURCE_DIR}/Sources)

# Executable
if (NOT UNITTEST)
    include(${CMAKE_SOURCE_DIR}/Application/App.cmake)
endif()

# Gtest/Gmock interface library
add_library(GtestGmockInterface INTERFACE)
target_include_directories(GtestGmockInterface
    INTERFACE
        ${CMAKE_SOURCE_DIR}/TestFramework/googlemock/gtest/include
        ${CMAKE_SOURCE_DIR}/TestFramework/googlemock/include
)