output "subnet_ids" {
  value = ["${aws_subnet.public_01.id}", "${aws_subnet.public_02.id}"]
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

