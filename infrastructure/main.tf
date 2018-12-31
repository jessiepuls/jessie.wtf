terraform {
  required_version  = "0.11.10"

  backend "s3" {
    bucket  = "terraform-states-jessiepuls"
    key     = "jessie.wtf.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  version = "1.50.0"
  region = "${var.region}"
}
