#!/bin/bash

TO="avizway@gmail.com"
SUBJECT="DISK Usage Report"

USAGE=$(df -h)

echo "$USAGE" | mail -s "$SUBJECT" "$TO"