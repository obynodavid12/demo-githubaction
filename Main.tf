terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.8.0"
      
    }
    random = {
      source = "hashicorp/random"
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
provider "random" {}

## Provider us-east-2
provider "aws" {
    version = "~> 0.13.5"
    region  = "us-east-2"
    profile = "kopsuser"
}















