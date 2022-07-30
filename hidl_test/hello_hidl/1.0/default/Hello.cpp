// FIXME: your file license if you have one

#include "Hello.h"

namespace vendor::ubnt::hello_hidl::implementation {

// Methods from ::vendor::ubnt::hello_hidl::V1_0::IHello follow.
Return<uint32_t> Hello::addition_hidl(uint32_t a, uint32_t b) {
    // TODO implement
    return uint32_t a + b;
}


// Methods from ::android::hidl::base::V1_0::IBase follow.

//IHello* HIDL_FETCH_IHello(const char* /* name */) {
    //return new Hello();
//}
//
}  // namespace vendor::ubnt::hello_hidl::implementation
