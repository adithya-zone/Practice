#!/bin/bash
AMI_ID="ami-01b6d88af12965bb6"
INSTANCE_TYPE="t2.micro"
KEY_NAME="key-0"
REGION="ap-south-1"
SECURITY_GROUP_ID="sg-01cab496f1e6a1fa3"
USER_DATA_FILE="install-web.sh"
TAG_NAME="Web-Server"

echo "Step 1: Launching an EC2 instance using shell script..."

INSTANCE_ID=$(aws ec2 run-instances --image-id  "$AMI_ID" --instance-type "$INSTANCE_TYPE" \
--key-name "$KEY_NAME" --security-group-ids "$SECURITY_GROUP_ID" \
--user-data file://"$USER_DATA_FILE" --region "$REGION" \
--tag-specifications "ResourceType=instance, Tags=[{Key=Name,Value=$TAG_NAME}]" \
--query "Instances[0].InstanceId" --output text)

echo "Instance ID: $INSTANCE_ID"

echo "Waiting for instance to enter into running state..."

aws ec2 wait instance-running --instance-ids "$INSTANCE_ID" --region "$REGION"

echo "Step 2: Fetching Public IP..."

PUBLIC_IP=$(aws ec2 describe-instances --instance-ids "$INSTANCE_ID" --region "$REGION" \
--query "Reservations[0].Instances[0].PublicIpAddress" --output text)

echo "EC2 Instance launched succesfully"
echo "Instance Public IP: $PUBLIC_IP"
echo "Access our webserver using this URL: http://$PUBLIC_IP"