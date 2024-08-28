provider "aws" {
  region = "${terraform.workspace == "production" ? "us-east-1" : "us-east-2"}"
  version = "~> 3.0"
}

terraform {
  backend "s3" {
    bucket = "teste-de-s3"
    encrypt = true
    key = "terraform-test.tfstate"
    region = "us-east-1"
  }
}