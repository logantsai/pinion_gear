echo $BASHPID > /sdcard/tempMonitor.pid

while true;
do
temp1_input=$(cat /sys/bus/i2c/devices/2-0070/hwmon/hwmon3/temp1_input)
time_flag=$(date "+%Y-%m-%d %H:%M:%S")
echo "$time_flag,$temp1_input" >> /sdcard/hwmon3.log
sleep 5

done







