#!/bin/bash
source ../../../build/envsetup.sh
lunch ua_safe-userdebug
PACKAGE=vendor.ubnt.hello_hidl@1.0
LOC="1.0/default"
# m -j hidl-gen

REDIR="-rvendor.ubnt:hardware/ubnt \
    -randroid.hidl:system/libhidl/transport $PACKAGE"

hidl-gen -o $LOC -Lc++-impl $REDIR
hidl-gen -o $LOC -Landroidbp-impl $REDIR
