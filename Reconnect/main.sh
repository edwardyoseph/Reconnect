#!/system/bin/sh
export PATH=/data/data/com.termux/files/usr/bin:/system/bin:/system/xbin

export WEBHOOK_URL="https://discord.com/api/webhooks/1443173436435337292/t3vNz49XQb7yhfhCCPkObgEgLNH3tl0Psz5sVD4wTGbnZSZyWGVdS5MhAPHSJER7fQ_P"
export PS_LINK="https://www.roblox.com/share?code=c6d7c2c8d16da4418942b068ddeff910&type=Server"

python /sdcard/data.py &
sleep 120

chmod +x /sdcard/reconnect.sh
sh /sdcard/reconnect.sh
