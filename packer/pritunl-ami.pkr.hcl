variable "region" {
  type    = string
  default = "eu-west-3"
}

variable "account_id" {
  type    = string
  default = "123456789"
}

packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
  }
}

source "amazon-ebs" "pritunl-ami" {
  ami_name      = "pritunl-ami-thaycafe"
  instance_type = "t3.medium"
  region        = var.region

  source_ami_filter {
    filters = {
      name                = "debian-12-amd64*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["amazon"]

  }
  ssh_username = "admin"
}

build {
  sources = ["source.amazon-ebs.pritunl-ami"]

  provisioner "shell" {
    script = "install_pritunl.sh"
  }
}