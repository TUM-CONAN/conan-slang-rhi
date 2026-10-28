# conan-slang-rhi

Conan 2 recipe for [slang-rhi](https://github.com/shader-slang/slang-rhi) (Vulkan + CUDA backends,
shared library). Versions are the dates of pinned upstream commits (`conandata.yml`).

    conan create . --version 2026.10.27 --user camposs --channel stable --build=missing

Requires `slang/2026.17.1@camposs/stable` (TUM-CONAN conan-slang) and ConanCenter `vulkan-headers`.
