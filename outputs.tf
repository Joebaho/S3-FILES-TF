output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_eip.this.public_ip
}

output "instance_public_dns" {
  description = "Public DNS of the EC2 instance"
  value       = aws_eip.this.public_dns
}

output "s3_bucket_name" {
  description = "Name of the created S3 bucket"
  value       = aws_s3_bucket.this.id
}

output "mount_point" {
  description = "Local directory where the S3 bucket is mounted"
  value       = var.mount_point
}