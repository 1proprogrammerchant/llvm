//==---------------- posix_pi.cpp ------------------------------------------==//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include <sycl/detail/defines.hpp>
#include <sycl/detail/pi.hpp>

#include <dlfcn.h>
#include <string>

namespace sycl {
__SYCL_INLINE_VER_NAMESPACE(_V1) {
namespace detail::pi {

void *loadOsLibrary(const std::string &LibraryPath) {
  // TODO: Check if the option RTLD_NOW is correct. Explore using
  // RTLD_DEEPBIND option when there are multiple plugins.
  void *so = dlopen(LibraryPath.c_str(), RTLD_NOW);
  if (!so && trace(TraceLevel::PI_TRACE_ALL)) {
    char *Error = dlerror();
    std::cerr << "SYCL_PI_TRACE[-1]: dlopen(" << LibraryPath
              << ") failed with <" << (Error ? Error : "unknown error") << ">"
              << std::endl;
  }
  return so;
}

void *loadOsPluginLibrary(const std::string &PluginPath) {
  return loadOsLibrary(PluginPath);
}

int unloadOsLibrary(void *Library) { return dlclose(Library); }

int unloadOsPluginLibrary(void *Library) {
  // The mock plugin does not have an associated library, so we allow nullptr
  // here to avoid it trying to free a non-existent library.
  if (!Library)
    return 0;
  return dlclose(Library);
}

void *getOsLibraryFuncAddress(void *Library, const std::string &FunctionName) {
  return dlsym(Library, FunctionName.c_str());
}

} // namespace detail::pi
} // __SYCL_INLINE_VER_NAMESPACE(_V1)
} // namespace sycl
