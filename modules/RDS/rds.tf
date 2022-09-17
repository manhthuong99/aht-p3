

resource "aws_db_subnet_group" "subnet_group" {
  name       = var.name
  subnet_ids = var.subnet_ids
  tags = {
    Name = "${var.name}-subnet-group"
  }
}

resource "aws_security_group" "rds" {
  name        = "${var.name}-SG"
  description = "${var.name} security group"
  vpc_id      = var.vpc_id

  ingress {
    description     = "allow mysql"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = var.allowed_sgs
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

resource "aws_db_instance" "db" {
  identifier             = var.name
  allocated_storage      = var.allocated_storage
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_type
  db_name                = var.db_name
  username               = var.db_user
  password               = var.db_password
  parameter_group_name   = var.parameter_group_name
  skip_final_snapshot    = var.skip_final_snapshot
  db_subnet_group_name   = aws_db_subnet_group.subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  tags = {
    "Name" = var.name
  }
}