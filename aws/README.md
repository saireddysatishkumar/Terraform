#Pre-req Install
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
aws --version

# Create a user and access keys in aws for terraform.

# Configure aws cli
aws configure
AWS Access Key ID [None]: xxx                    
AWS Secret Access Key [None]: xxx
Default region name [None]: 
Default output format [None]: 

>VPC creation
````
## Initialize terraform
terraform  init -reconfigure -backend-config=backend-prod.tfvars

## Terraform Plan
terraform plan -var-file="prod.tfvars"

## Terraform apply
terraform apply -var-file="prod.tfvars"
````
