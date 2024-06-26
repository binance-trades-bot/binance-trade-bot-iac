terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.41.0"
    }
  }
}

provider "aws" {
  region                   = "sa-east-1"
  shared_credentials_files = ["~/.aws/credentials"]
}
