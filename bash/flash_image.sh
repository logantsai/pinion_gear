#!/bin/bash

if [[ -z $@ ]];
then
	echo -e "you should enter a image at leat.\n"
fi

fastboot_dev=`fastboot devices`
if [ -z $fastboot_dev ]
then
	adb root
	adb disable-verity
	adb reboot bootloader
else
	echo "Exist $fastboot_dev"
fi

function flash_vendor()
{
cat << EOF
	################
		vendor
	################
EOF
	fastboot flash vendor vendor.img
}

function flash_kernel()
{
cat << EOF
	###################
        kernel + dtb
	###################
EOF
	fastboot flash boot boot.img && fastboot flash dtbo dtbo.img
}

function flash_lk()
{
cat << EOF
	################
	    lk
	################
EOF
	fastboot flash aboot emmc_appsboot.mbn
}

FUNC="$@"
for f in $FUNC
do
	case $f in
		"vendor")
			echo "flash vendor"
			flash_vendor
			;;
		"kernel")
			echo "flash kernel"
			flash_kernel
			;;
		"lk")
			echo "flash lk"
			flash_lk
			;;
		*) echo "unknow."
	esac
done

fastboot reboot
