#!/bin/bash
THRESHOLD=10
TOPIC_ARN="arn:aws:sns:ap-south-1:035090529524:mail-alert-shell"
SUBJECT="Disk Usage Alert"
HOSTNAME=$(hostname)
DATE=$(date "+%Y-%m-%d %H:%M:%S")
BODY=""

while read -r filesystem size used avail percent mount; do
  USAGE=$(echo "$percent" | tr -d '%')
  if [ "$USAGE" -ge "$THRESHOLD" ]; then
    if [ -z "$BODY" ]; then
      BODY="Disk alert from $HOSTNAME at $DATE:"
    fi
    BODY+=$'\n'"$mount is at ${USAGE}% usage"
  fi
done < <(df -h | grep '^/dev/')

if [ -n "$BODY" ]; then
  aws sns publish \
    --topic-arn "$TOPIC_ARN" \
    --subject "$SUBJECT" \
    --message "$BODY"
fi
