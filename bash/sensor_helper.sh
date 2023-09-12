adb root
adb remount | grep -e failed


if [ $? == "0" ]; then
	echo "adb remount failed !!"
	adb disable-verity
	adb reboot
	exit 1
fi

if [ -z $1 ]; then
	echo "Shoud input target sesnor_def_qcomdev*.conf"
	exit 1
fi

[ -z $2 ] && UPDATE_FW="0" || UPDATE_FW="1"
TOP_ROOT="/home/marktsai/project/apq8053/snapdragon-high-mid-2018-spf-1-0-1_amss_standard_oem/"
ADSP_FW="ADSP.VT.3.0/adsp_proc/obj/8953/LA/system/etc/firmware/adsp.*"

## copy fw
if [ $UPDATE_FW == "1" ]; then
	adb shell "mount -o remount,rw /vendor/firmware_mnt "
	adb shell "rm /vendor/firmware_mnt/image/adsp.*"
	adb push $TOP_ROOT/$ADSP_FW /vendor/firmware_mnt/image/
	# adb push $TOP_ROOT/ADSP.VT.3.0/adsp_proc/obj/8953/adsp.mbn /vendor/firmware_mnt/image/
fi

# copy config
adb shell rm /vendor/etc/sensors/sensor_def_qcomdev.conf
adb push $1 /vendor/etc/sensors/sensor_def_qcomdev.conf
adb shell chmod 644 /vendor/etc/sensors/sensor_def_qcomdev.conf
adb shell rm /mnt/vendor/persist/sensors/sns.reg

adb reboot


# echo 'related' > /sys/bus/msm_subsys/devices/subsys2/restart_level
