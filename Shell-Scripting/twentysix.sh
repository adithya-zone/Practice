#!/bin/bash

APP_LOGS_DIR="/home/cloudshell-user/app-logs"
DATE=$(date +%F-%H-%M-%S)
LOGS_DIR="/home/cloudshell-user/shell-logs"
SCRIPT_NAME=$(basename "$0")
LOGFILE="$LOGS_DIR/${SCRIPT_NAME}-${DATE}.LOG"

# Create log directory if not exists
mkdir -p "$LOGS_DIR"

echo "Script started executing at $DATE" >> "$LOGFILE"

# Find logs older than 14 days
FILES_TO_DELETE=$(find "$APP_LOGS_DIR" -name "*.log" -type f -mtime +12)

while read -r line; do
    if [ -n "$line" ]; then
        echo "Deleting $line" >> "$LOGFILE"
        rm -rf "$line"
    fi
done <<< "$FILES_TO_DELETE"

echo "Script execution completed at $(date +%F-%H-%M-%S)" >> "$LOGFILE"
 