"""
Conan 2.x recipe for slang-rhi — Slang's rendering hardware interface (Vulkan, CUDA, ...).

slang-rhi has no releases; versions are the date of the pinned upstream commit (conandata.yml).
Built from source with the Vulkan and CUDA backends only (no D3D11/D3D12, Metal, WebGPU, OptiX,
NVAPI, Aftermath), as a shared library. Slang comes from slang/<version>@camposs/stable and the
Vulkan headers from ConanCenter's vulkan-headers instead of slang-rhi's own downloads.

Provides: slang-rhi::slang-rhi

Channel: camposs/stable
"""

import os

from conan import ConanFile
from conan.tools.cmake import CMake, CMakeDeps, CMakeToolchain, cmake_layout
from conan.tools.files import copy, get


class SlangRhiConan(ConanFile):
    name = "slang-rhi"
    description = "Slang rendering hardware interface: one API over Vulkan, D3D12, Metal, CUDA, WebGPU."
    license = "Apache-2.0"
    url = "https://github.com/TUM-CONAN/conan-slang-rhi"
    homepage = "https://github.com/shader-slang/slang-rhi"
    topics = ("graphics", "vulkan", "cuda", "slang", "rhi")
    settings = "os", "arch", "compiler", "build_type"
    package_type = "shared-library"

    def layout(self):
        cmake_layout(self, src_folder="src")

    def requirements(self):
        data = self.conan_data["sources"][self.version]
        # slang-rhi's public header includes slang.h and links the Slang runtime.
        self.requires(f"slang/{data['slang']}@camposs/stable", transitive_headers=True, transitive_libs=True)
        self.requires(f"vulkan-headers/{data['vulkan_headers']}")

    def source(self):
        data = self.conan_data["sources"][self.version]
        get(self, data["url"], sha256=data["sha256"], strip_root=data.get("strip_root", True))

    def generate(self):
        slang = self.dependencies["slang"]
        vulkan = self.dependencies["vulkan-headers"]
        tc = CMakeToolchain(self)
        tc.cache_variables["SLANG_RHI_BUILD_SHARED"] = True
        tc.cache_variables["SLANG_RHI_BUILD_TESTS"] = False
        tc.cache_variables["SLANG_RHI_BUILD_TESTS_WITH_GLFW"] = False
        tc.cache_variables["SLANG_RHI_BUILD_EXAMPLES"] = False
        tc.cache_variables["SLANG_RHI_INSTALL"] = True
        tc.cache_variables["SLANG_RHI_FETCH_SLANG"] = False
        tc.cache_variables["SLANG_RHI_SLANG_INCLUDE_DIR"] = os.path.join(slang.package_folder, "include")
        tc.cache_variables["SLANG_RHI_SLANG_BINARY_DIR"] = slang.package_folder
        tc.cache_variables["SLANG_RHI_FETCH_DXC"] = False
        for backend in ("CPU", "D3D11", "D3D12", "AGILITY_SDK", "NVAPI", "METAL", "OPTIX", "WGPU", "AFTERMATH"):
            tc.cache_variables[f"SLANG_RHI_ENABLE_{backend}"] = False
        tc.cache_variables["SLANG_RHI_ENABLE_VULKAN"] = True
        tc.cache_variables["SLANG_RHI_ENABLE_CUDA"] = True
        # FetchPackage(vulkan_headers ...) -> use the Conan package instead of a download.
        tc.cache_variables["FETCHCONTENT_SOURCE_DIR_VULKAN_HEADERS"] = vulkan.package_folder
        tc.generate()
        CMakeDeps(self).generate()

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()

    def package(self):
        copy(self, "LICENSE", src=self.source_folder, dst=os.path.join(self.package_folder, "licenses"))
        CMake(self).install()

    def package_info(self):
        self.cpp_info.set_property("cmake_file_name", "slang-rhi")
        self.cpp_info.set_property("cmake_target_name", "slang-rhi::slang-rhi")
        self.cpp_info.libs = ["slang-rhi"]
        if self.settings.os == "Linux":
            self.cpp_info.system_libs = ["dl", "pthread"]
