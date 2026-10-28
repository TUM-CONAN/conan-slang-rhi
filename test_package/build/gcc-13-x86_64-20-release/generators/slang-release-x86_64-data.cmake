########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

list(APPEND slang_COMPONENT_NAMES slang::slang slang::slang-rt slang::gfx)
list(REMOVE_DUPLICATES slang_COMPONENT_NAMES)
if(DEFINED slang_FIND_DEPENDENCY_NAMES)
  list(APPEND slang_FIND_DEPENDENCY_NAMES )
  list(REMOVE_DUPLICATES slang_FIND_DEPENDENCY_NAMES)
else()
  set(slang_FIND_DEPENDENCY_NAMES )
endif()

########### VARIABLES #######################################################################
#############################################################################################
set(slang_PACKAGE_FOLDER_RELEASE "/home/ecku/.conan2/p/b/slangea533cae8c945/p")
set(slang_BUILD_MODULES_PATHS_RELEASE )


set(slang_INCLUDE_DIRS_RELEASE "${slang_PACKAGE_FOLDER_RELEASE}/include")
set(slang_RES_DIRS_RELEASE )
set(slang_DEFINITIONS_RELEASE )
set(slang_SHARED_LINK_FLAGS_RELEASE )
set(slang_EXE_LINK_FLAGS_RELEASE )
set(slang_OBJECTS_RELEASE )
set(slang_COMPILE_DEFINITIONS_RELEASE )
set(slang_COMPILE_OPTIONS_C_RELEASE )
set(slang_COMPILE_OPTIONS_CXX_RELEASE )
set(slang_LIB_DIRS_RELEASE "${slang_PACKAGE_FOLDER_RELEASE}/lib")
set(slang_BIN_DIRS_RELEASE "${slang_PACKAGE_FOLDER_RELEASE}/bin")
set(slang_LIBRARY_TYPE_RELEASE SHARED)
set(slang_IS_HOST_WINDOWS_RELEASE 0)
set(slang_LIBS_RELEASE gfx slang-rt slang-compiler)
set(slang_SYSTEM_LIBS_RELEASE )
set(slang_FRAMEWORK_DIRS_RELEASE )
set(slang_FRAMEWORKS_RELEASE )
set(slang_BUILD_DIRS_RELEASE )
set(slang_NO_SONAME_MODE_RELEASE FALSE)


# COMPOUND VARIABLES
set(slang_COMPILE_OPTIONS_RELEASE)
if (NOT "${slang_COMPILE_OPTIONS_CXX_RELEASE}" STREQUAL "")
    list(APPEND slang_COMPILE_OPTIONS_RELEASE
        "$<$<COMPILE_LANGUAGE:CXX>:${slang_COMPILE_OPTIONS_CXX_RELEASE}>")
endif ()
if (NOT "${slang_COMPILE_OPTIONS_C_RELEASE}" STREQUAL "")
    list(APPEND slang_COMPILE_OPTIONS_RELEASE
        "$<$<COMPILE_LANGUAGE:C>:${slang_COMPILE_OPTIONS_C_RELEASE}>")
endif ()
set(slang_LINKER_FLAGS_RELEASE)
if (NOT "${slang_SHARED_LINK_FLAGS_RELEASE}" STREQUAL "")
    list(APPEND slang_LINKER_FLAGS_RELEASE
        "$<$<OR:$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>,$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>>:${slang_SHARED_LINK_FLAGS_RELEASE}>")
endif ()
if (NOT "${slang_EXE_LINK_FLAGS_RELEASE}" STREQUAL "")
    list(APPEND slang_LINKER_FLAGS_RELEASE
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${slang_EXE_LINK_FLAGS_RELEASE}>")
endif ()


set(slang_COMPONENTS_RELEASE slang::slang slang::slang-rt slang::gfx)
########### COMPONENT slang::gfx VARIABLES ############################################

set(slang_slang_gfx_INCLUDE_DIRS_RELEASE "${slang_PACKAGE_FOLDER_RELEASE}/include")
set(slang_slang_gfx_LIB_DIRS_RELEASE "${slang_PACKAGE_FOLDER_RELEASE}/lib")
set(slang_slang_gfx_BIN_DIRS_RELEASE "${slang_PACKAGE_FOLDER_RELEASE}/bin")
set(slang_slang_gfx_LIBRARY_TYPE_RELEASE SHARED)
set(slang_slang_gfx_IS_HOST_WINDOWS_RELEASE 0)
set(slang_slang_gfx_RES_DIRS_RELEASE )
set(slang_slang_gfx_DEFINITIONS_RELEASE )
set(slang_slang_gfx_OBJECTS_RELEASE )
set(slang_slang_gfx_COMPILE_DEFINITIONS_RELEASE )
set(slang_slang_gfx_COMPILE_OPTIONS_C_RELEASE "")
set(slang_slang_gfx_COMPILE_OPTIONS_CXX_RELEASE "")
set(slang_slang_gfx_LIBS_RELEASE gfx)
set(slang_slang_gfx_SYSTEM_LIBS_RELEASE )
set(slang_slang_gfx_FRAMEWORK_DIRS_RELEASE )
set(slang_slang_gfx_FRAMEWORKS_RELEASE )
set(slang_slang_gfx_DEPENDENCIES_RELEASE slang::slang)
set(slang_slang_gfx_SHARED_LINK_FLAGS_RELEASE )
set(slang_slang_gfx_EXE_LINK_FLAGS_RELEASE )
set(slang_slang_gfx_NO_SONAME_MODE_RELEASE FALSE)

# COMPOUND VARIABLES
set(slang_slang_gfx_LINKER_FLAGS_RELEASE)
if (NOT "${slang_slang_gfx_SHARED_LINK_FLAGS_RELEASE}" STREQUAL "")
    list(APPEND slang_slang_gfx_LINKER_FLAGS_RELEASE
        $<$<OR:$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>,$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>>:${slang_slang_gfx_SHARED_LINK_FLAGS_RELEASE}>)
endif ()
if (NOT "${slang_slang_gfx_EXE_LINK_FLAGS_RELEASE}" STREQUAL "")
    list(APPEND slang_slang_gfx_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${slang_slang_gfx_EXE_LINK_FLAGS_RELEASE}>)
endif ()
set(slang_slang_gfx_COMPILE_OPTIONS_RELEASE)
if (NOT "${slang_slang_gfx_COMPILE_OPTIONS_CXX_RELEASE}" STREQUAL "")
    list(APPEND slang_slang_gfx_COMPILE_OPTIONS_RELEASE
        "$<$<COMPILE_LANGUAGE:CXX>:${slang_slang_gfx_COMPILE_OPTIONS_CXX_RELEASE}>")
endif ()
if (NOT "${slang_slang_gfx_COMPILE_OPTIONS_C_RELEASE}" STREQUAL "")
    list(APPEND slang_slang_gfx_COMPILE_OPTIONS_RELEASE
        "$<$<COMPILE_LANGUAGE:C>:${slang_slang_gfx_COMPILE_OPTIONS_C_RELEASE}>")
endif ()
########### COMPONENT slang::slang-rt VARIABLES ############################################

set(slang_slang_slang-rt_INCLUDE_DIRS_RELEASE "${slang_PACKAGE_FOLDER_RELEASE}/include")
set(slang_slang_slang-rt_LIB_DIRS_RELEASE "${slang_PACKAGE_FOLDER_RELEASE}/lib")
set(slang_slang_slang-rt_BIN_DIRS_RELEASE "${slang_PACKAGE_FOLDER_RELEASE}/bin")
set(slang_slang_slang-rt_LIBRARY_TYPE_RELEASE SHARED)
set(slang_slang_slang-rt_IS_HOST_WINDOWS_RELEASE 0)
set(slang_slang_slang-rt_RES_DIRS_RELEASE )
set(slang_slang_slang-rt_DEFINITIONS_RELEASE )
set(slang_slang_slang-rt_OBJECTS_RELEASE )
set(slang_slang_slang-rt_COMPILE_DEFINITIONS_RELEASE )
set(slang_slang_slang-rt_COMPILE_OPTIONS_C_RELEASE "")
set(slang_slang_slang-rt_COMPILE_OPTIONS_CXX_RELEASE "")
set(slang_slang_slang-rt_LIBS_RELEASE slang-rt)
set(slang_slang_slang-rt_SYSTEM_LIBS_RELEASE )
set(slang_slang_slang-rt_FRAMEWORK_DIRS_RELEASE )
set(slang_slang_slang-rt_FRAMEWORKS_RELEASE )
set(slang_slang_slang-rt_DEPENDENCIES_RELEASE )
set(slang_slang_slang-rt_SHARED_LINK_FLAGS_RELEASE )
set(slang_slang_slang-rt_EXE_LINK_FLAGS_RELEASE )
set(slang_slang_slang-rt_NO_SONAME_MODE_RELEASE FALSE)

# COMPOUND VARIABLES
set(slang_slang_slang-rt_LINKER_FLAGS_RELEASE)
if (NOT "${slang_slang_slang-rt_SHARED_LINK_FLAGS_RELEASE}" STREQUAL "")
    list(APPEND slang_slang_slang-rt_LINKER_FLAGS_RELEASE
        $<$<OR:$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>,$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>>:${slang_slang_slang-rt_SHARED_LINK_FLAGS_RELEASE}>)
endif ()
if (NOT "${slang_slang_slang-rt_EXE_LINK_FLAGS_RELEASE}" STREQUAL "")
    list(APPEND slang_slang_slang-rt_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${slang_slang_slang-rt_EXE_LINK_FLAGS_RELEASE}>)
endif ()
set(slang_slang_slang-rt_COMPILE_OPTIONS_RELEASE)
if (NOT "${slang_slang_slang-rt_COMPILE_OPTIONS_CXX_RELEASE}" STREQUAL "")
    list(APPEND slang_slang_slang-rt_COMPILE_OPTIONS_RELEASE
        "$<$<COMPILE_LANGUAGE:CXX>:${slang_slang_slang-rt_COMPILE_OPTIONS_CXX_RELEASE}>")
endif ()
if (NOT "${slang_slang_slang-rt_COMPILE_OPTIONS_C_RELEASE}" STREQUAL "")
    list(APPEND slang_slang_slang-rt_COMPILE_OPTIONS_RELEASE
        "$<$<COMPILE_LANGUAGE:C>:${slang_slang_slang-rt_COMPILE_OPTIONS_C_RELEASE}>")
endif ()
########### COMPONENT slang::slang VARIABLES ############################################

set(slang_slang_slang_INCLUDE_DIRS_RELEASE "${slang_PACKAGE_FOLDER_RELEASE}/include")
set(slang_slang_slang_LIB_DIRS_RELEASE "${slang_PACKAGE_FOLDER_RELEASE}/lib")
set(slang_slang_slang_BIN_DIRS_RELEASE "${slang_PACKAGE_FOLDER_RELEASE}/bin")
set(slang_slang_slang_LIBRARY_TYPE_RELEASE SHARED)
set(slang_slang_slang_IS_HOST_WINDOWS_RELEASE 0)
set(slang_slang_slang_RES_DIRS_RELEASE )
set(slang_slang_slang_DEFINITIONS_RELEASE )
set(slang_slang_slang_OBJECTS_RELEASE )
set(slang_slang_slang_COMPILE_DEFINITIONS_RELEASE )
set(slang_slang_slang_COMPILE_OPTIONS_C_RELEASE "")
set(slang_slang_slang_COMPILE_OPTIONS_CXX_RELEASE "")
set(slang_slang_slang_LIBS_RELEASE slang-compiler)
set(slang_slang_slang_SYSTEM_LIBS_RELEASE )
set(slang_slang_slang_FRAMEWORK_DIRS_RELEASE )
set(slang_slang_slang_FRAMEWORKS_RELEASE )
set(slang_slang_slang_DEPENDENCIES_RELEASE )
set(slang_slang_slang_SHARED_LINK_FLAGS_RELEASE )
set(slang_slang_slang_EXE_LINK_FLAGS_RELEASE )
set(slang_slang_slang_NO_SONAME_MODE_RELEASE FALSE)

# COMPOUND VARIABLES
set(slang_slang_slang_LINKER_FLAGS_RELEASE)
if (NOT "${slang_slang_slang_SHARED_LINK_FLAGS_RELEASE}" STREQUAL "")
    list(APPEND slang_slang_slang_LINKER_FLAGS_RELEASE
        $<$<OR:$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>,$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>>:${slang_slang_slang_SHARED_LINK_FLAGS_RELEASE}>)
endif ()
if (NOT "${slang_slang_slang_EXE_LINK_FLAGS_RELEASE}" STREQUAL "")
    list(APPEND slang_slang_slang_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${slang_slang_slang_EXE_LINK_FLAGS_RELEASE}>)
endif ()
set(slang_slang_slang_COMPILE_OPTIONS_RELEASE)
if (NOT "${slang_slang_slang_COMPILE_OPTIONS_CXX_RELEASE}" STREQUAL "")
    list(APPEND slang_slang_slang_COMPILE_OPTIONS_RELEASE
        "$<$<COMPILE_LANGUAGE:CXX>:${slang_slang_slang_COMPILE_OPTIONS_CXX_RELEASE}>")
endif ()
if (NOT "${slang_slang_slang_COMPILE_OPTIONS_C_RELEASE}" STREQUAL "")
    list(APPEND slang_slang_slang_COMPILE_OPTIONS_RELEASE
        "$<$<COMPILE_LANGUAGE:C>:${slang_slang_slang_COMPILE_OPTIONS_C_RELEASE}>")
endif ()