#!/bin/bash
 TO="sunny9912094338@gmail.com"
 HOSTNAME=$(hostname)
    DATE=$(date "+%Y-%m-%d %H:%M:%S")
    SUBJECT="DISK Usage Report from $HOSTNAME - $DATE"
    USAGE=$(df -h | grep '^/dev')
    echo -e "Disk usage report from $HOSTNAME at $DATE:\n\n$USAGE" | mail -s "$SUBJECT" "$TO"