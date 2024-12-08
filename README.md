# Pritunl AWS Provisioning with Packer and Terraform

This repository automates the provisioning of a [Pritunl](https://pritunl.com/) VPN server in AWS using **Packer** and **Terraform**. 

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
  - [Build the Image with Packer](#build-the-image-with-packer)
  - [Provision the Infrastructure with Terraform](#provision-the-infrastructure-with-terraform)
- [Project Structure](#project-structure)
- [Roadmap](#roadmap)
- [License](#license)

## Overview

[Pritunl](https://pritunl.com/) is a user-friendly open-source VPN server. This project provides an Infrastructure as Code (IaC) solution to:
1. Build a custom AMI with Pritunl pre-installed using **Packer**.
2. Deploy the VPN server in AWS using **Terraform**.

## Features

- Automated image creation with Pritunl installed.
- Infrastructure provisioning with security group and EC2 instance configuration.
- Configurable variables for flexibility.

## Prerequisites

- [Packer](https://www.packer.io/) installed.
- [Terraform](https://www.terraform.io/) installed.
- SSH key pair

## Usage

### 1. Build the Image with Packer

1. Clone this repository:
   ```bash
   git clone https://github.com/thaycafe/pritunl-provisioning.git
   cd pritunl-provisioning
   ```

2. Navigate to the Packer directory:
   ```bash
   cd packer/
   ```

3. Validate the Packer template:
   ```bash
   packer validate .
   ```

4. Build the AMI:
   ```bash
   packer build .
   ```

5. Note the created AMI ID for the next step.

### 2. Provision the Infrastructure with Terraform

1. Navigate to the Terraform directory:
   ```bash
   cd ../terraform/
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Edit the `terraform.tfvars` file to specify your variables, including the AMI ID from the previous step.

4. Plan the infrastructure:
   ```bash
   terraform plan
   ```

5. Apply the infrastructure changes:
   ```bash
   terraform apply
   ```

6. After deployment, note the server's public IP and access Pritunl via its web interface.