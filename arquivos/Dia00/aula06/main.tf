provider "aws" {
  region = "us-east-1"
  version = "~> 3.0"
}

provider "aws" {
  alias = "west"
  region = "us-west-1"
  version = "~> 3.0"
}
provider "aws" {
  alias = "east"
  region = "us-east-1"
  version = "~> 3.0"
}