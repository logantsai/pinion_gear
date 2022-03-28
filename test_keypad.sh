#!/bin/sh

device='/dev/input/event3'
led_class='/sys/class/leds'

led_on="10"
led_off="0"

while true;
do
	msg=$(getevent -l -c 1 /dev/input/event3 | awk '{print $2}')
	case $msg in
		KEY_NUMERIC_1)
			echo $led_on > $led_class/key1/brightness
			sleep 0.1
			echo $led_off > $led_class/key1/brightness
			;;
		KEY_NUMERIC_2)
			echo $led_on > $led_class/key2/brightness
			sleep 0.1
			echo $led_off > $led_class/key2/brightness
			;;
		KEY_NUMERIC_3)
			echo $led_on > $led_class/key3/brightness
			sleep 0.1
			echo $led_off > $led_class/key3/brightness
			;;
		KEY_NUMERIC_4)
			echo $led_on > $led_class/key4/brightness
			sleep 0.1
			echo $led_off > $led_class/key4/brightness
			;;
		KEY_NUMERIC_5)
			echo $led_on > $led_class/key5/brightness
			sleep 0.1
			echo $led_off > $led_class/key5/brightness
			;;
		KEY_NUMERIC_6)
			echo $led_on > $led_class/key6/brightness
			sleep 0.1
			echo $led_off > $led_class/key6/brightness
			;;
		KEY_NUMERIC_7)
			echo $led_on > $led_class/key7/brightness
			sleep 0.1
			echo $led_off > $led_class/key7/brightness
			;;
		KEY_NUMERIC_8)
			echo $led_on > $led_class/key8/brightness
			sleep 0.1
			echo $led_off > $led_class/key8/brightness
			;;
		KEY_NUMERIC_9)
			echo $led_on > $led_class/key9/brightness
			sleep 0.1
			echo $led_off > $led_class/key9/brightness
			;;
		KEY_NUMERIC_STAR)
			echo $led_on > $led_class/key-start/brightness
			sleep 0.1
			echo $led_off > $led_class/key-start/brightness
			;;
		KEY_NUMERIC_0)
			echo $led_on > $led_class/key0/brightness
			sleep 0.1
			echo $led_off > $led_class/key0/brightness
			;;
		KEY_NUMERIC_POUND)
			echo $led_on > $led_class/key-pound/brightness
			sleep 0.1
			echo $led_off > $led_class/key-pound/brightness
			;;
	esac
done


