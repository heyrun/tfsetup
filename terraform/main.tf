terraform {
  backend "s3" {
    bucket         = "transformtest01"
    key            = "recipe-app.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "recipe-app-api-devops-tf-state-lock"
  }
}

provider "aws" {
  region  = "us-east-1"
  version = "~> 3.0"
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  command_tags = {
    Environment = terraform.workspace
    Project     = var.project
    Owner       = var.contact
    ManagedBy   = "Terraform"

  }
}