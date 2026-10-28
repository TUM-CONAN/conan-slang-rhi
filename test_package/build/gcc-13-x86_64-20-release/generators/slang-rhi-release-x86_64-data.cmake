########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(slang-rhi_COMPONENT_NAMES "")
if(DEFINED slang-rhi_FIND_DEPENDENCY_NAMES)
  list(APPEND slang-rhi_FIND_DEPENDENCY_NAMES slang)
  list(REMOVE_DUPLICATES slang-rhi_FIND_DEPENDENCY_NAMES)
else()
  set(slang-rhi_FIND_DEPENDENCY_NAMES slang)
endif()
set(slang_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(slang-rhi_PACKAGE_FOLDER_RELEASE "/home/ecku/.conan2/p/b/slang729e5ea07ba19/p")
set(slang-rhi_BUILD_MODULES_PATHS_RELEASE )


set(slang-rhi_INCLUDE_DIRS_RELEASE "${slang-rhi_PACKAGE_FOLDER_RELEASE}/include")
set(slang-rhi_RES_DIRS_RELEASE )
set(slang-rhi_DEFINITIONS_RELEASE )
set(slang-rhi_SHARED_LINK_FLAGS_RELEASE )
set(slang-rhi_EXE_LINK_FLAGS_RELEASE )
set(slang-rhi_OBJECTS_RELEASE )
set(slang-rhi_COMPILE_DEFINITIONS_RELEASE )
set(slang-rhi_COMPILE_OPTIONS_C_RELEASE )
set(slang-rhi_COMPILE_OPTIONS_CXX_RELEASE )
set(slang-rhi_LIB_DIRS_RELEASE "${slang-rhi_PACKAGE_FOLDER_RELEASE}/lib")
set(slang-rhi_BIN_DIRS_RELEASE "${slang-rhi_PACKAGE_FOLDER_RELEASE}/bin")
set(slang-rhi_LIBRARY_TYPE_RELEASE SHARED)
set(slang-rhi_IS_HOST_WINDOWS_RELEASE 0)
set(slang-rhi_LIBS_RELEASE slang-rhi)
set(slang-rhi_SYSTEM_LIBS_RELEASE dl pthread)
set(slang-rhi_FRAMEWORK_DIRS_RELEASE )
set(slang-rhi_FRAMEWORKS_RELEASE )
set(slang-rhi_BUILD_DIRS_RELEASE )
set(slang-rhi_NO_SONAME_MODE_RELEASE FALSE)


# COMPOUND VARIABLES
set(slang-rhi_COMPILE_OPTIONS_RELEASE)
if (NOT "${slang-rhi_COMPILE_OPTIONS_CXX_RELEASE}" STREQUAL "")
    list(APPEND slang-rhi_COMPILE_OPTIONS_RELEASE
        "$<$<COMPILE_LANGUAGE:CXX>:${slang-rhi_COMPILE_OPTIONS_CXX_RELEASE}>")
endif ()
if (NOT "${slang-rhi_COMPILE_OPTIONS_C_RELEASE}" STREQUAL "")
    list(APPEND slang-rhi_COMPILE_OPTIONS_RELEASE
        "$<$<COMPILE_LANGUAGE:C>:${slang-rhi_COMPILE_OPTIONS_C_RELEASE}>")
endif ()
set(slang-rhi_LINKER_FLAGS_RELEASE)
if (NOT "${slang-rhi_SHARED_LINK_FLAGS_RELEASE}" STREQUAL "")
    list(APPEND slang-rhi_LINKER_FLAGS_RELEASE
        "$<$<OR:$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>,$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>>:${slang-rhi_SHARED_LINK_FLAGS_RELEASE}>")
endif ()
if (NOT "${slang-rhi_EXE_LINK_FLAGS_RELEASE}" STREQUAL "")
    list(APPEND slang-rhi_LINKER_FLAGS_RELEASE
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${slang-rhi_EXE_LINK_FLAGS_RELEASE}>")
endif ()


set(slang-rhi_COMPONENTS_RELEASE )