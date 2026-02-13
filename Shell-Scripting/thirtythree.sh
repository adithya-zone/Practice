#!/bin/bash

REGION="ap-south-1"
SOURCE_DIR="/Users/sunny/Desktop/script"

read -p "Enter the bucket name you want to create: " BUCKET_NAME

echo "Step 1: Creating an S3 Bucket: $BUCKET_NAME ..."
aws s3api create-bucket --bucket "$BUCKET_NAME" --region "$REGION" --create-bucket-configuration LocationConstraint="$REGION"

if [ $? -ne 0 ]; then
    echo "Failed to create bucket and exiting from script... "
    exit 1
fi

echo "Bucket Created: $BUCKET_NAME"

echo "Step 2: Enabling Versioning on the new bucket.."
aws s3api put-bucket-versioning --bucket "$BUCKET_NAME" --versioning-configuration Status=Enabled

echo "Step 3: Uploading files from $SOURCE_DIR to $BUCKET_NAME bucket"
aws s3 sync $SOURCE_DIR "s3://$BUCKET_NAME"

echo "All steps completed and bucket name is $BUCKET_NAME"
