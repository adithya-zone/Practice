#!/bin/bash
date=$(date +%A)
SCRIPT_NAME=$(basename "$0")
LOGFILE="/tmp/${SCRIPT_NAME}.log"


RED="\e[31m"
GREEN="\e[32m"
NORMAL="\e[0m"

VALIDATE()
{
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ... $RED Failed $NORMAL"
        exit 1
    else
        echo -e "$2 ... $GREEN Succedded $NORMAL"
    fi
}

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR::Switch to root user and execute the program"
    exit 1
fi

TOOLS=("tree" "git" "mariadb105" "wget")
for tool in "${TOOLS[@]}"
do
    yum install "$tool" -y &>> "$LOGFILE"
    VALIDATE $? "Installation of $tool"
done
