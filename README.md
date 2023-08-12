## Pre-requisites
> Install aws cli.
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
aws --version

# Create a user and access keys from AWS IAM console, for terraform.

# Configure aws cli
aws configure
AWS Access Key ID [None]:                     
AWS Secret Access Key [None]: 
Default region name [None]: 
Default output format [None]: 

# Create S3 bucket and dynamoDB for Terraform statfile.
terraform init 
terraform apply 

## AWS Projects:
>Project1: Run an demo application using ECS Cluster.  
Resources: ECR, ECS(FARGATE), ALB.
````
cd vpc
Step1:  
Create ECR.(terraform)  
Login to ECR and Push image  

Step2:  
Create ALB(terraform)

Step3:
Create Task Definition(terraform)
Create ECS cluster(terraform)
Create Service (terraform)

Step4: 
Validation  
````
>Project2:
````

````
>Project3:
````

````
>Project4:
````

````
>Project5:
````

````
