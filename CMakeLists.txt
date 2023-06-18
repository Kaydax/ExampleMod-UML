# CONFIG: Choose a proper project/target name
cmake_minimum_required(VERSION 3.25.0)
cmake_policy(SET CMP0141 NEW)
project(ExampleMod)

# CONFIG: Set bigobj files (*.cpp) with thousands of functions to export
set(MOD_BIGOBJ_FILES
	# ...
)

# CONFIG: Set other header/source files (*.h/*.hpp/*.cpp) here
set(MOD_FILES
	${MOD_BIGOBJ_FILES} # bigobj from above are also source code files
	external/UnrealModLoader/UnrealEngineModLoader/UE4/Basic.cpp
	external/UnrealModLoader/UnrealEngineModLoader/UE4/CoreUObject_functions.cpp
	external/UnrealModLoader/UnrealEngineModLoader/UE4/Ue4.hpp
	dllmain.cpp
	ExampleMod.cpp
	ExampleMod.h
	Logging.h
)
set_source_files_properties(${MOD_BIGOBJ_FILES} PROPERTIES COMPILE_OPTIONS "/bigobj")

add_library(${PROJECT_NAME} SHARED ${MOD_FILES})
set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD 17)
add_subdirectory(external/UnrealModLoader/UnrealEngineModLoader/)

# definitions
target_compile_definitions(${PROJECT_NAME} PRIVATE _UNICODE)

# includes>
# CONFIG: set your include directories here
target_include_directories(${PROJECT_NAME} PUBLIC external/UnrealModLoader/UnrealEngineModLoader/UnrealEngineModLoader)
target_include_directories(${PROJECT_NAME} PUBLIC external/UnrealModLoader/UnrealEngineModLoader)
target_include_directories(${PROJECT_NAME} PUBLIC external/UnrealModLoader/UnrealEngineModLoader/MinHook)
#target_include_directories(${PROJECT_NAME} PUBLIC $ENV{INCLUDE})

# linking
# CONFIG: set folders with libraries here
#target_link_directories(${PROJECT_NAME} PUBLIC YOUR_PATH_TO_LIBRARY)
target_link_libraries(${PROJECT_NAME} PUBLIC UnrealEngineModLoader)
# CONFIG: set library names only here (no folders)
#target_link_libraries(${PROJECT_NAME} PUBLIC YOUR_LIBRARY_NAME)
target_link_libraries(${PROJECT_NAME} PUBLIC d3dcompiler.lib)