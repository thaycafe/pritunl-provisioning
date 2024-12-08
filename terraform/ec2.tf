resource "aws_security_group" "pritunl-sg" {

  ingress {
    cidr_blocks = var.allow_ssh_from_cidrs

    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }

  ingress {
    cidr_blocks = var.allow_ssh_from_cidrs

    from_port = 443
    to_port   = 443
    protocol  = "tcp"
  }

  ingress {
    cidr_blocks = var.allow_ssh_from_cidrs

    from_port = 80
    to_port   = 80
    protocol  = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_key_pair" "ssh-key" {
  key_name   = var.key_name
  public_key = file(var.key_file_path)
}

resource "aws_instance" "pritunl" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.pritunl-sg.name]
  key_name        = var.key_name
}