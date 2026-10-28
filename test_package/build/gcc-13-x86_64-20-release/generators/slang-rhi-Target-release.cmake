# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(slang-rhi_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(slang-rhi_FRAMEWORKS_FOUND_RELEASE "${slang-rhi_FRAMEWORKS_RELEASE}" "${slang-rhi_FRAMEWORK_DIRS_RELEASE}")

set(slang-rhi_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET slang-rhi_DEPS_TARGET)
    add_library(slang-rhi_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET slang-rhi_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${slang-rhi_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${slang-rhi_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:slang::slang>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### slang-rhi_DEPS_TARGET to all of them
conan_package_library_targets("${slang-rhi_LIBS_RELEASE}"    # libraries
                              "${slang-rhi_LIB_DIRS_RELEASE}" # package_libdir
                              "${slang-rhi_BIN_DIRS_RELEASE}" # package_bindir
                              "${slang-rhi_LIBRARY_TYPE_RELEASE}"
                              "${slang-rhi_IS_HOST_WINDOWS_RELEASE}"
                              slang-rhi_DEPS_TARGET
                              slang-rhi_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "slang-rhi"    # package_name
                              "${slang-rhi_NO_SONAME_MODE_RELEASE}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${slang-rhi_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET slang-rhi::slang-rhi
                 APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${slang-rhi_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${slang-rhi_LIBRARIES_TARGETS}>
                 )

    if("${slang-rhi_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET slang-rhi::slang-rhi
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     slang-rhi_DEPS_TARGET)
    endif()

    set_property(TARGET slang-rhi::slang-rhi
                 APPEND PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${slang-rhi_LINKER_FLAGS_RELEASE}>)
    set_property(TARGET slang-rhi::slang-rhi
                 APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${slang-rhi_INCLUDE_DIRS_RELEASE}>)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET slang-rhi::slang-rhi
                 APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Release>:${slang-rhi_LIB_DIRS_RELEASE}>)
    set_property(TARGET slang-rhi::slang-rhi
                 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${slang-rhi_COMPILE_DEFINITIONS_RELEASE}>)
    set_property(TARGET slang-rhi::slang-rhi
                 APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${slang-rhi_COMPILE_OPTIONS_RELEASE}>)

########## For the modules (FindXXX)
set(slang-rhi_LIBRARIES_RELEASE slang-rhi::slang-rhi)
