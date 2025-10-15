project(Application C CXX)
  
set(SRC_FILES
    ${CMAKE_CURRENT_LIST_DIR}/Main.cpp
)      

# Creation de l'exe à partir des fichiers Sources ${SRC_FILES}
add_executable(${PROJECT_NAME} ${SRC_FILES})

target_link_libraries(${PROJECT_NAME} SourcesLib )

target_include_directories(${PROJECT_NAME}
	PRIVATE
		$<TARGET_PROPERTY:SourcesLib,INTERFACE_INCLUDE_DIRECTORIES>
)

set_target_properties(${PROJECT_NAME} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

if (CMAKE_COMPILER_IS_GNUCXX)

    set_target_properties(${PROJECT_NAME} PROPERTIES SUFFIX .exe)

else()

    set_target_properties(${PROJECT_NAME} PROPERTIES SUFFIX .bin)

endif()