#!/bin/bash
set -e

BUCKET_NAME=${BUCKET_NAME}
MOUNT_POINT=${MOUNT_POINT}

# Update package list and install s3fs
apt-get update -y
apt-get install -y s3fs

# Create mount point directory
mkdir -p $MOUNT_POINT

# Mount the S3 bucket using the IAM role attached to the instance
s3fs $BUCKET_NAME $MOUNT_POINT -o allow_other,use_cache=/tmp,iam_role=auto

# Add to /etc/fstab for persistence after reboot
echo "s3fs#$BUCKET_NAME $MOUNT_POINT fuse.s3fs _netdev,allow_other,use_cache=/tmp,iam_role=auto 0 0" | tee -a /etc/fstab

# Set permissions on the mount point
chmod 775 $MOUNT_POINT

echo "S3 bucket mounted successfully at $MOUNT_POINT"