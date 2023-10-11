provider "aws" {
  region = "us-east-2"

  default_tags {
    tags = {
      team = "DevOps"
    }
  }
}
terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
