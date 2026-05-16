variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-west-2"
}

variable "bucket_name" {
  description = "Name of the S3 bucket to create and mount"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of an existing EC2 key pair to enable SSH access"
  type        = string
}

variable "mount_point" {
  description = "Local directory where the S3 bucket will be mounted"
  type        = string
  default     = "/mnt/s3-bucket"
}