provider "aws" {
  region = "us-east-1"
  version = "~> 3.0"
}

terraform {
  backend "s3" {
    bucket = "teste-de-s3"
    key = "terraform-test.tfstate"
    region = "us-east-1"
  }
}