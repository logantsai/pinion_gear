

function reboot_by_ssh() {
	count=0;
	while true;
	do
		time_flag=`date "+[%Y-%m-%d %H:%M:%S]"`
		if ping -c 1 192.168.1.48 > /dev/null 2>&1; then
			count=$((count+1))
			echo "${time_flag} Device boot up and reboot it. count=${count}"
			ssh root@192.168.1.48 "systemctl reboot"
			sleep 4
		else
			echo "${time_flag} Wait device boot up ..."
			sleep 1
		fi

	done | tee tmp.log
}
function reboot_by_adb() {
	count=0;
	while true;
	do
		time_flag=`date "+[%Y-%m-%d %H:%M:%S]"`
		if adb get-state > /dev/null 2>&1; then
			count=$((count+1))
			echo "${time_flag} Device boot up and reboot it. count=${count}"
			adb shell "systemctl reboot"
			sleep 4
		else
			echo "${time_flag} Wait device boot up ..."
			sleep 1
		fi

	done | tee tmp.log
}


reboot_by_adb
