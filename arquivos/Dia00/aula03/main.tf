provider "aws" {
    region = "us-east-1"
    version = "~> 2.0"
}
terraform {
  backend "s3" {
    bucket= "nome-do-bucket"
    key= "terraform-teste.tfstate"
    region = "us-east-1"
  }
}