#!/bin/bash

LOG_FILE="/sdcard/log.txt"   # Lokasi file log
PS_LINK="https://www.roblox.com/share?code=c6d7c2c8d16da4418942b068ddeff910&type=Server"
ACT="com.roblox.client.startup.ActivitySplash"

while true; do
    echo "SCANNING DATA"

    # Mengambil blok per bot dari file log
    awk -v RS="--------------------------------------------------" '
    NF > 0 {
        username="";
        client="";
        status="";
        for(i=1;i<=NF;i++){
            if($i=="Username:"){ username=$(i+1) }
            if($i=="ClientName:"){ client=$(i+1) }
            if($i=="Status:"){ status=$(i+1) }
        }
        printf "%s|%s|%s\n", username, client, status
    }' "$LOG_FILE" | while IFS="|" read -r USER CLIENT STATUS
    do
        # Skip jika kosong
        [ -z "$CLIENT" ] && continue

        echo "Bot: $USER | Package: $CLIENT | Status: $STATUS"

        if [ "$STATUS" = "Offline" ]; then
            echo "[OFFLINE] Restart Roblox + Join PS"
            
            am start -n "$CLIENT/$ACT"
            sleep 10

            am start -a android.intent.action.VIEW -d "$PS_LINK" -p "$CLIENT"
            sleep 25
        fi

        if [ "$STATUS" = "Home" ]; then
            echo "[HOME] Join Private Server saja"

            am start -a android.intent.action.VIEW -d "$PS_LINK" -p "$CLIENT"
            sleep 25
        fi

    done
    sleep 30
done