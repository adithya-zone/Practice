#!/bin/bash
USERID=$(id -u)

VALIDATE(){
if [ $1 -eq 0 ]
then
echo "tree package installed successfully"
exit 1
echo "tree package installation failed"
fi
}

if [ $USERID -ne 0 ]
then
echo "error:switch to root user"
exit 1
fi


yum install mariadb105 -y
VALIDATE $?

yum install tree -y
VALIDATE $?