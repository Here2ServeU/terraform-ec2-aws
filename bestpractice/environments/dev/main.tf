terraform {
  backend "s3" {
    bucket         = "my-terraform-backend"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
  }
}

module "security_group" {
  source              = "../../modules/security_group"
  security_group_name = "dev-web-app-sg"
}

module "ec2" {
  source           = "../../modules/ec2"
  ami_id           = "ami-0e1bed4f06a3b463d"
  instance_type    = "t2.micro"
  key_name         = "web-app-key-pair"
  security_group_id = module.security_group.security_group_id
  subnet_id        = "subnet-0abcd1234" # Replace with actual subnet ID
  instance_name    = "dev-web-app"
}