terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

 required_version = ">= 1.0.0"    #Inserire sempre, prima di terraform init

}

provider "aws" {
  region = var.region
}


#Ad ogni module vengono associati i relativi Outputs 


module "my_vpc" {
  source = "./modules/vpc"       #path del modulo VPC

  vpc_cidr           = "14.0.0.0/16"
  public_sub_1_cidr  = "14.0.0.0/20"
  public_sub_2_cidr  = "14.0.16.0/20"
  private_sub_1_cidr = "14.0.128.0/20"
  private_sub_2_cidr = "14.0.144.0/20"
}

module "my_ec2" {                #path del modulo EC2
  source = "./modules/ec2"

  public_subnet_id = module.my_vpc.public_subnet_id
  public_sg_id     = module.my_vpc.public_sg_id

  private_subnet_id = module.my_vpc.private_subnet_id
  private_sg_id     = module.my_vpc.private_sg_id  
  test_sg_id        = module.my_vpc.test_sg_id


}


