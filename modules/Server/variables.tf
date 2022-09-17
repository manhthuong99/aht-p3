variable "name" {
}

variable "subnet_id" {
}

variable "public_key" {
}

variable "instance_type" {
}

variable "vpc_id" {
}

variable "instance_ami" {
  default = "ami-0b89f7b3f054b957e"
}

variable "allowed_ips" {
  type = list(string)
}