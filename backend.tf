provider "aws" {
  region  = var.aws_region
  version = "= 3.0"
}

terraform {
  backend "s3" {
    bucket = "metal.corp-devops-test"
    key    = "terraform-labapp.tfstate"
    region = "us-east-2"
  }
}
