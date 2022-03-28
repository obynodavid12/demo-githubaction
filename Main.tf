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
provider "random" {}

## Provider us-east-2
provider "aws" {
##  version = ">= 3.63.0"
  region = "us-east-2"
}





## backend data for terraform -this was replaced in the Main.tf file when we use terraform cloud
# terraform {
#   # Terraform version at the time of writing this script
#   required_version = ">= 0.12.24"

#   backend "s3" {
#      bucket = "dataalgebrabackendtf"
#      key    = "quickdataalgebrabackend_2.tfstate"
#      region = "us-east-2"
#   }
# }

# ## random provider
# provider "random" {}

# ## Provider us-east-2
# provider "aws" {
#   region = "us-east-2"
#}
