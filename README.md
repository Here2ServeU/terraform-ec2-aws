# Instructions

This project has 3 primary folders: 
- test folder that has only one Terraform configuration file to deploy our infrastructure. 
- dev folder that is a little closer to the best practices. 
- bestpractice folder offers the way you should structure your project. 

The bestpractice folder has the following as part of the project structure: 
- modules: They define the resources you deploy as part of your project. 
- environments: They define the environment where you want to deploy your infrastructure. 
- backendsetup: It defines the storage where you want to remotely store your state file and how to lock it. 

---
## Set Backend
```bash
cd backend-setup
terraform init
terraform apply
```

## Deploy Environment
```bash
cd environments/dev
terraform init
terraform plan
terraform apply
```

## Clean Up
```bash
terraform destroy
```