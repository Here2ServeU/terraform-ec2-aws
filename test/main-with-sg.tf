provider "aws" {
  region = "us-east-1"
}

resource "tls_private_key" "web_app_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "web_app_key_pair" {
  key_name   = "web-app-key-pair"
  public_key = tls_private_key.web_app_key.public_key_openssh
}

resource "local_file" "private_key" {
  filename        = "${path.module}/web-app-key-pair.pem"
  content         = tls_private_key.web_app_key.private_key_pem
  file_permission = "0400"
}

resource "aws_security_group" "web_sg" {
  name        = "web-app-sg"
  description = "Allow SSH and HTTP access"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH from any IP. Update as needed for better security.
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP from any IP
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web App Security Group"
  }
}

# Get the default VPC
data "aws_vpc" "default" {
  default = true
}

# Get a specific subnet in the default VPC
data "aws_subnet" "default_subnet" {
  vpc_id           = data.aws_vpc.default.id
  availability_zone = "us-east-1a" # Specify an availability zone to narrow down the match
}

resource "aws_instance" "web" {
  ami           = "ami-0e1bed4f06a3b463d" # Replace with your desired AMI ID
  instance_type = "t2.micro"
  key_name      = aws_key_pair.web_app_key_pair.key_name

  # Attach the security group and subnet
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id              = data.aws_subnet.default_subnet.id

  tags = {
    Name = "Terraform EC2 Instance"
  }
}

output "instance_public_ip" {
  value = aws_instance.web.public_ip
}

output "pem_file_path" {
  value = local_file.private_key.filename
}