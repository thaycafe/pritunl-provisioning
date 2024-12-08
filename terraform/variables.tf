variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "default"
}

variable "key_file_path" {
  default = "key.pub"
}

variable "allow_ssh_from_cidrs" {
  default = ["0.0.0.0/0"]
}

variable "ami_id" {
  default = "ami-123456789"
}