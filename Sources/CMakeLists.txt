project(SourcesLib C CXX)

# Component source files
set(SRC_FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/MyClass.cpp
)

add_library(${PROJECT_NAME} ${SRC_FILES})

target_include_directories(${PROJECT_NAME}
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}
    )

if (UNITTEST)

    set(TEST_NAME MyClass_UnitTest)

    # Add test source files
    set(TEST_FILES
        test/MyClassUnitTests.cpp
    )

    # Add test executable
    add_executable(${TEST_NAME} ${TEST_FILES})
    target_link_libraries(${TEST_NAME} ${PROJECT_NAME} gtest_main gmock)

    target_include_directories(${TEST_NAME}
        PRIVATE
            $<TARGET_PROPERTY:GtestGmockInterface,INTERFACE_INCLUDE_DIRECTORIES>
    )
    
    # Add test to ctest
    add_test(${TEST_NAME} ${TEST_NAME})

endif()