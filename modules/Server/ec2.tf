resource "aws_key_pair" "key" {
  key_name   = var.name
  public_key = var.public_key
}

resource "aws_security_group" "web_server" {
  name        = "${var.name}-SG"
  description = "${var.name} security group"
  vpc_id      = var.vpc_id

  ingress {
    description = "allow ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ips
  }

  ingress {
    description = "allow http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_ips
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.name}-SG"
  }
}

resource "aws_eip" "eip" {
  instance = aws_instance.web_server.id
  vpc      = true
  tags = {
    Name = "${var.name}-eip"
  }
}

resource "aws_instance" "web_server" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.web_server.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.key.key_name
  tags = {
    Name = "${var.name}-Server"
  }
}