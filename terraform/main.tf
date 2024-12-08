provider "aws" {
  region = "sa-east-1"

  default_tags {
    tags = {
      Project = "Pritunl VPN"
    }
  }
}


terraform {
  backend "s3" {
    bucket = "pritunl-provisioning-remote-bucket"
    key    = "pritunl-provisioning.tfstate"
    region = "eu-west-3"

    dynamodb_table = "pritunl-provisioning"
    encrypt        = true
  }
}