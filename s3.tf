# s3.tf - with force_destroy to enable automatic cleanup on destroy

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  # ✅ This is the critical line: forces deletion of all objects and versions
  force_destroy = true

  tags = {
    Name        = var.bucket_name
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}

# Enable versioning on the bucket (now safe because force_destroy will remove all versions)
resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Block public access by default
resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}