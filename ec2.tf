# EC2 instance with Ubuntu
resource "aws_instance" "this" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  user_data = templatefile("${path.module}/userdata.sh", {
    BUCKET_NAME = var.bucket_name
    MOUNT_POINT = var.mount_point
  })

  tags = {
    Name      = "s3-mounted-ubuntu-instance"
    OS        = "Ubuntu 22.04"
    ManagedBy = "Terraform"
  }
}

# Elastic IP (optional)
resource "aws_eip" "this" {
  instance = aws_instance.this.id
  domain   = "vpc"
}