#!/system/bin/sh
export PATH=/data/data/com.termux/files/usr/bin:/system/bin:/system/xbin

export WEBHOOK_URL=""
export PS_LINK=""

python /sdcard/data.py &
sleep 120

chmod +x /sdcard/reconnect.sh
sh /sdcard/reconnect.sh

