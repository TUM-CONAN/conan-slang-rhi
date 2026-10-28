########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(slang-rhi_FIND_QUIETLY)
    set(slang-rhi_MESSAGE_MODE VERBOSE)
else()
    set(slang-rhi_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/slang-rhiTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${slang-rhi_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(slang-rhi_VERSION_STRING "2026.10.27")
set(slang-rhi_INCLUDE_DIRS ${slang-rhi_INCLUDE_DIRS_RELEASE} )
set(slang-rhi_INCLUDE_DIR ${slang-rhi_INCLUDE_DIRS_RELEASE} )
set(slang-rhi_LIBRARIES ${slang-rhi_LIBRARIES_RELEASE} )
set(slang-rhi_DEFINITIONS ${slang-rhi_DEFINITIONS_RELEASE} )


# Definition of extra CMake variables from cmake_extra_variables


# Only the last installed configuration BUILD_MODULES are included to avoid the collision
foreach(_BUILD_MODULE ${slang-rhi_BUILD_MODULES_PATHS_RELEASE} )
    message(${slang-rhi_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


