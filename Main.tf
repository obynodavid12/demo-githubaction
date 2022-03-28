terraform {
  required_providers {
    aws = {
      version  = "~> 2.13.0"

    }
    random = {
      version = ">= 2.1.2"
    }
  }
  
  required_version = "~> 1.1.7"
  cloud {
  organization = "AWS-DataalgebraCloud"

    workspace {
      name = "AWS-DataalgebraCloud"
    }
  }
}

## random provider
provider "random" {}

## Provider us-east-2
provider "aws" {
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