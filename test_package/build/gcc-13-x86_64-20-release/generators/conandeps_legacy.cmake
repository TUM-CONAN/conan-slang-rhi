message(STATUS "Conan: Using CMakeDeps conandeps_legacy.cmake aggregator via include()")
message(STATUS "Conan: It is recommended to use explicit find_package() per dependency instead")

find_package(slang-rhi)

set(CONANDEPS_LEGACY  slang-rhi::slang-rhi )