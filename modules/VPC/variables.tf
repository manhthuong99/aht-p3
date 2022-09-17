variable "name" {
}

variable "vpc_cidr" {
  default = "10.100.0.0/16"
}

variable "public_subnet_cidr" {
  default = ["10.100.1.0/24", "10.100.3.0/24"]
}
variable "availability_zone" {
  default = ["ap-southeast-1a", "ap-southeast-1b"]
}

variable "enable_dns_support" {
  default = "true"
}

variable "enable_dns_hostnames" {
  default = "true"
}
