provider "aws" {
  region     = "eu-north-1"
  access_key = your-access-key
  secret_key = your-secret-key
}

resource "aws_instance" "EC2-Instance" {
  availability_zone      = "eu-north-1a"
  ami                    = "ami-0989fb15ce71ba39e"
  instance_type          = "t3.micro"
  key_name               = "key/name"
  vpc_security_group_ids = [aws_security_group.DefaultTerraformSG.id]
  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 10
    volume_type = "standard"
    tags = {
      Name = "root-disk"
    }
  }
}
resource "aws_security_group" "DefaultTerraformSG" {
  name        = "DefaultTerraformSG"
  description = "Allow 22, 80, 443 inbound taffic"

  dynamic "ingress" {
    for_each = ["22", "80", "443", "8080", "8000"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_iam_user" "my_user" {
  name = "my-user"
}

resource "aws_iam_group_membership" "my_membership" {
  name  = "my-membership"
  users = [aws_iam_user.my_user.name]
  group = aws_iam_group.my_group.name
}

resource "aws_iam_group" "my_group" {
  name = "my-group"
}

resource "aws_iam_policy" "my_group_policy" {
  name        = "my-group-policy"
  description = "My IAM group policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["ec2:Describe*"]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_group_policy_attachment" "my_attachment" {
  group      = aws_iam_group.my_group.name
  policy_arn = aws_iam_policy.my_group_policy.arn
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "banka" 

  tags = {
    Name        = "My Terraform Bucket"
    Environment = "Production"
  }
}
resource "aws_s3_bucket_object" "my_folder" {
  bucket = "banka"
  key    = "files/"
  source = "/your/path/and/file"
}
resource "aws_s3_bucket_object" "my_object" {
  bucket = "banka"
  key    = "path/file"
  source = "path/file" 
}
output "presigned_url" {
  value = "https://banka.s3.eu-north-1.amazonaws.com/path/file"
}
