provider "aws" {
  region = var.region 
}

module "vpc"{
        source                          = "../modules/vpc"
        company                         = var.company
        env                             = var.env 
        az                              = var.az 
        cidr_block                      = var.cidr_block 
        availability_zone               = var.availability_zone 
        zones                           = var.zones
        public_subnet_cidr_block        = var.public_subnet_cidr_block 
        private_subnet_cidr_block       = var.private_subnet_cidr_block 
        app                             = var.app 
}

terraform {
  backend "s3" {
        bucket          = var.bucket 
        key             = var.key 
        region          = var.region 
        dynamodb_table  = var.dynamodb_table 
        encrypt         = var.encrypt 
}
} 
