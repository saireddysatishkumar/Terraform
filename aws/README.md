## Pre-requisites for AWS projects
> Install aws cli.  
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"  
sudo installer -pkg AWSCLIV2.pkg -target /  
aws --version  

## Create a user and access keys from AWS IAM console, for terraform.

## Configure aws cli
aws configure  
AWS Access Key ID [None]:                     
AWS Secret Access Key [None]:   
Default region name [None]:   
Default output format [None]:  

## Create prod workspace  
terraform workspace new prod

## Create S3 bucket and dynamoDB for Terraform statfile.
cd aws
terraform init   
terraform apply 

## Create vpc
cd aws/vpc  
terraform apply -var-file="apple-prod.tfvars" -lock=false  (or)  
terraform  init -reconfigure -backend-config=backend-prod.tfvars 
terraform plan -var-file=apple-prod.tfvars
terraform apply -var-file=apple-prod.tfvars

