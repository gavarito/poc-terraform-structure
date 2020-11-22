provider "aws" {
  region    = "us-east-1"
  version   = "~> 2.0"
}

terraform {
  backend "s3" {
    bucket  = "curso-iaas"
    key     = "curso-terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}