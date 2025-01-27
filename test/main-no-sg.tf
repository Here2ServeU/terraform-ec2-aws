# provider "aws" {
#   region = "us-east-1" # Replace with your desired AWS region
# }

# resource "tls_private_key" "terraform_key" {
#   algorithm = "RSA"
#   rsa_bits  = 2048
# }

# resource "aws_key_pair" "terraform_key_pair" {
#   key_name   = "terraform-key-pair" # Replace with your desired key pair name
#   public_key = tls_private_key.terraform_key.public_key_openssh
# }

# resource "local_file" "private_key" {
#   filename = "${path.module}/terraform-key-pair.pem"
#   content  = tls_private_key.terraform_key.private_key_pem
# }

# resource "aws_instance" "web" {
#   ami           = "ami-0e2c8caa4b6378d8c" # Replace with your desired AMI ID
#   instance_type = "t2.micro"             # Replace with your desired instance type
#   key_name      = aws_key_pair.terraform_key_pair.key_name

#   tags = {
#     Name = "Terraform EC2 Instance"
#   }
# }

# output "instance_public_ip" {
#   value = aws_instance.web.public_ip
# }

# output "pem_file_path" {
#   value = "${path.module}/terraform-key-pair.pem"
# }