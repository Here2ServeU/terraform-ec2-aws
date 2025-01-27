output "instance_public_ip" {
  description = "The public IP of the deployed EC2 instance"
  value       = aws_instance.web.public_ip
}

output "pem_file_path" {
  description = "The file path of the private key used for SSH access"
  value       = local_file.private_key.filename
}