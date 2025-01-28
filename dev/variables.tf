variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
}

variable "key_name" {
  description = "The name of the key pair"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
}

variable "availability_zone" {
  description = "The availability zone for the subnet"
  type        = string
}
