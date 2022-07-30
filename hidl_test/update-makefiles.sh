#!/bin/bash

set -e

if [ -z "$ANDROID_BUILD_TOP" ]; then
	echo "Missing ANDROID_BUILD_TOP env variable. Run lunch first."
	exit 0;
fi


source $ANDROID_BUILD_TOP/system/tools/hidl/update-makefiles-helper.sh

do_makefiles_update \
	"vendor.ubnt:hardware/ubnt" \
    "android.hidl:system/libhidl/transport"
