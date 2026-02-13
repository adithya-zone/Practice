#!/bin/bash

THRESHOLD=10 
TO="sunny9912094338@gmail.com"
HOSTNAME=$(hostname)
DATE=$(date "+%Y-%m-%d %H:%M:%S")
SUBJECT="Disk usage Alert"
BODY=""

while read -r filesystem size used avail percent mount; do
    USAGE=$(echo "$percent" | tr -d '%')

    if [ "$USAGE" -ge "$THRESHOLD" ]; then
        BODY+="$mount is at ${USAGE}% usage\n"
    fi
done < <(df -h | grep '^/dev')

if [ -n "$BODY" ]; then
    echo -e "DISK alert from $HOSTNAME at $DATE:\n\n$BODY" | mail -s "$SUBJECT" "$TO"
fi