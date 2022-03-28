terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.63"
    }
    random = {
      source = "hashicorp/aws"
      version = ">=3.0.0"
    }     
  }
  
  cloud {
  organization = "Dataalgebra-Cloud"

    workspaces {
      name = "AWS-DataalgebraCloud"
    }
  }
}

## random provider
##provider "random" {}

## Provider us-east-2
provider "aws" {
  region = "us-east-2"
  profile = "kopsuser"
}









