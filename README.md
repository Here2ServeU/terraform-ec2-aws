# Instructions

The project has 3 primary folders: 
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