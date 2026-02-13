#!/bin/bash

NUMBER=$1

if [ -z "$NUMBER" ]; then
    echo "Please enter a number as an argument"
    exit 1
fi

if [ "$NUMBER" -gt 10 ]; then
    echo "$NUMBER is greater than 10"
else
    echo "$NUMBER is not greater than 10"
fi