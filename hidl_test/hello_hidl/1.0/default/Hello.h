// FIXME: your file license if you have one

#pragma once

#include <vendor/ubnt/hello_hidl/1.0/IHello.h>
#include <hidl/MQDescriptor.h>
#include <hidl/Status.h>

namespace vendor::ubnt::hello_hidl::implementation {

using ::android::hardware::hidl_array;
using ::android::hardware::hidl_memory;
using ::android::hardware::hidl_string;
using ::android::hardware::hidl_vec;
using ::android::hardware::Return;
using ::android::hardware::Void;
using ::android::sp;

struct Hello : public V1_0::IHello {
    // Methods from ::vendor::ubnt::hello_hidl::V1_0::IHello follow.
    Return<uint32_t> addition_hidl(uint32_t a, uint32_t b) override;

    // Methods from ::android::hidl::base::V1_0::IBase follow.

};

// FIXME: most likely delete, this is only for passthrough implementations
// extern "C" IHello* HIDL_FETCH_IHello(const char* name);

}  // namespace vendor::ubnt::hello_hidl::implementation
