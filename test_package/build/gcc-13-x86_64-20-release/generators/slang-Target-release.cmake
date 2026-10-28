# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(slang_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(slang_FRAMEWORKS_FOUND_RELEASE "${slang_FRAMEWORKS_RELEASE}" "${slang_FRAMEWORK_DIRS_RELEASE}")

set(slang_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET slang_DEPS_TARGET)
    add_library(slang_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET slang_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${slang_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${slang_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:slang::slang>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### slang_DEPS_TARGET to all of them
conan_package_library_targets("${slang_LIBS_RELEASE}"    # libraries
                              "${slang_LIB_DIRS_RELEASE}" # package_libdir
                              "${slang_BIN_DIRS_RELEASE}" # package_bindir
                              "${slang_LIBRARY_TYPE_RELEASE}"
                              "${slang_IS_HOST_WINDOWS_RELEASE}"
                              slang_DEPS_TARGET
                              slang_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "slang"    # package_name
                              "${slang_NO_SONAME_MODE_RELEASE}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${slang_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## COMPONENTS TARGET PROPERTIES Release ########################################

    ########## COMPONENT slang::gfx #############

        set(slang_slang_gfx_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(slang_slang_gfx_FRAMEWORKS_FOUND_RELEASE "${slang_slang_gfx_FRAMEWORKS_RELEASE}" "${slang_slang_gfx_FRAMEWORK_DIRS_RELEASE}")

        set(slang_slang_gfx_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET slang_slang_gfx_DEPS_TARGET)
            add_library(slang_slang_gfx_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET slang_slang_gfx_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${slang_slang_gfx_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${slang_slang_gfx_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${slang_slang_gfx_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'slang_slang_gfx_DEPS_TARGET' to all of them
        conan_package_library_targets("${slang_slang_gfx_LIBS_RELEASE}"
                              "${slang_slang_gfx_LIB_DIRS_RELEASE}"
                              "${slang_slang_gfx_BIN_DIRS_RELEASE}" # package_bindir
                              "${slang_slang_gfx_LIBRARY_TYPE_RELEASE}"
                              "${slang_slang_gfx_IS_HOST_WINDOWS_RELEASE}"
                              slang_slang_gfx_DEPS_TARGET
                              slang_slang_gfx_LIBRARIES_TARGETS
                              "_RELEASE"
                              "slang_slang_gfx"
                              "${slang_slang_gfx_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET slang::gfx
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${slang_slang_gfx_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${slang_slang_gfx_LIBRARIES_TARGETS}>
                     )

        if("${slang_slang_gfx_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET slang::gfx
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         slang_slang_gfx_DEPS_TARGET)
        endif()

        set_property(TARGET slang::gfx APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${slang_slang_gfx_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET slang::gfx APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${slang_slang_gfx_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET slang::gfx APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${slang_slang_gfx_LIB_DIRS_RELEASE}>)
        set_property(TARGET slang::gfx APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${slang_slang_gfx_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET slang::gfx APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${slang_slang_gfx_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT slang::slang-rt #############

        set(slang_slang_slang-rt_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(slang_slang_slang-rt_FRAMEWORKS_FOUND_RELEASE "${slang_slang_slang-rt_FRAMEWORKS_RELEASE}" "${slang_slang_slang-rt_FRAMEWORK_DIRS_RELEASE}")

        set(slang_slang_slang-rt_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET slang_slang_slang-rt_DEPS_TARGET)
            add_library(slang_slang_slang-rt_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET slang_slang_slang-rt_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${slang_slang_slang-rt_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${slang_slang_slang-rt_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${slang_slang_slang-rt_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'slang_slang_slang-rt_DEPS_TARGET' to all of them
        conan_package_library_targets("${slang_slang_slang-rt_LIBS_RELEASE}"
                              "${slang_slang_slang-rt_LIB_DIRS_RELEASE}"
                              "${slang_slang_slang-rt_BIN_DIRS_RELEASE}" # package_bindir
                              "${slang_slang_slang-rt_LIBRARY_TYPE_RELEASE}"
                              "${slang_slang_slang-rt_IS_HOST_WINDOWS_RELEASE}"
                              slang_slang_slang-rt_DEPS_TARGET
                              slang_slang_slang-rt_LIBRARIES_TARGETS
                              "_RELEASE"
                              "slang_slang_slang-rt"
                              "${slang_slang_slang-rt_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET slang::slang-rt
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${slang_slang_slang-rt_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${slang_slang_slang-rt_LIBRARIES_TARGETS}>
                     )

        if("${slang_slang_slang-rt_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET slang::slang-rt
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         slang_slang_slang-rt_DEPS_TARGET)
        endif()

        set_property(TARGET slang::slang-rt APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${slang_slang_slang-rt_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET slang::slang-rt APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${slang_slang_slang-rt_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET slang::slang-rt APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${slang_slang_slang-rt_LIB_DIRS_RELEASE}>)
        set_property(TARGET slang::slang-rt APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${slang_slang_slang-rt_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET slang::slang-rt APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${slang_slang_slang-rt_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT slang::slang #############

        set(slang_slang_slang_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(slang_slang_slang_FRAMEWORKS_FOUND_RELEASE "${slang_slang_slang_FRAMEWORKS_RELEASE}" "${slang_slang_slang_FRAMEWORK_DIRS_RELEASE}")

        set(slang_slang_slang_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET slang_slang_slang_DEPS_TARGET)
            add_library(slang_slang_slang_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET slang_slang_slang_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${slang_slang_slang_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${slang_slang_slang_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${slang_slang_slang_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'slang_slang_slang_DEPS_TARGET' to all of them
        conan_package_library_targets("${slang_slang_slang_LIBS_RELEASE}"
                              "${slang_slang_slang_LIB_DIRS_RELEASE}"
                              "${slang_slang_slang_BIN_DIRS_RELEASE}" # package_bindir
                              "${slang_slang_slang_LIBRARY_TYPE_RELEASE}"
                              "${slang_slang_slang_IS_HOST_WINDOWS_RELEASE}"
                              slang_slang_slang_DEPS_TARGET
                              slang_slang_slang_LIBRARIES_TARGETS
                              "_RELEASE"
                              "slang_slang_slang"
                              "${slang_slang_slang_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET slang::slang
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${slang_slang_slang_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${slang_slang_slang_LIBRARIES_TARGETS}>
                     )

        if("${slang_slang_slang_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET slang::slang
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         slang_slang_slang_DEPS_TARGET)
        endif()

        set_property(TARGET slang::slang APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${slang_slang_slang_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET slang::slang APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${slang_slang_slang_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET slang::slang APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${slang_slang_slang_LIB_DIRS_RELEASE}>)
        set_property(TARGET slang::slang APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${slang_slang_slang_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET slang::slang APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${slang_slang_slang_COMPILE_OPTIONS_RELEASE}>)


    ########## AGGREGATED GLOBAL TARGET WITH THE COMPONENTS #####################
    set_property(TARGET slang::slang APPEND PROPERTY INTERFACE_LINK_LIBRARIES slang::gfx)
    set_property(TARGET slang::slang APPEND PROPERTY INTERFACE_LINK_LIBRARIES slang::slang-rt)
    set_property(TARGET slang::slang APPEND PROPERTY INTERFACE_LINK_LIBRARIES slang::slang)

########## For the modules (FindXXX)
set(slang_LIBRARIES_RELEASE slang::slang)
