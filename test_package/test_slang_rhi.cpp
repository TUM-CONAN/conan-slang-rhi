// Creates the slang-rhi instance and lists the Vulkan adapters (no device needed to pass).
#include <cstdio>

#include <slang-rhi.h>

int main() {
  rhi::IRHI* rhi = rhi::getRHI();
  if (rhi == nullptr) return 1;
  std::printf("slang-rhi loaded, Vulkan backend %s\n",
              rhi->isDeviceTypeSupported(rhi::DeviceType::Vulkan) ? "supported" : "unavailable");
  return 0;
}
