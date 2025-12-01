#!/system/bin/sh
export PATH=/data/data/com.termux/files/usr/bin:/system/bin:/system/xbin

python /sdcard/data.py &
sleep 90

chmod +x /sdcard/reconnect.sh
sh /sdcard/reconnect.sh