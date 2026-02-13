#!/bin/bash

USERID=[ id -u ]
if [ $userid -nq 0 ];then 
    echo "switch to root user to performe the operation"
    exit1
fi
 yem install tree -y
if [ $? -eq 0 ];then 
    echo "tree package installed successfully"
else
    echo "tree package installation failed"
fi
 yum install mariadb105 -y
if [ $? -eq 0 ];then 
    echo "mysql client installed successfully"
else
    echo "mysql client installation failed"
fi
