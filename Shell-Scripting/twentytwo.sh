#!/bin/bash
date=$(date +%A)
SCRIPT_NAME=$(basename "$0")
LOGFILE="/tmp/${SCRIPT_NAME}.log"
echo "Script started on $(date)" >> "$LOGFILE"
yum update -y &>> "$LOGFILE"