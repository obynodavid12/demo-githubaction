terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.27"
      
    }
  }
  required_version = ">= 0.14.9"

}
  cloud {
    organization = "Dataalgebra-Cloud"
    workspaces {
      name = "AWS-DataalgebraCloud"
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















