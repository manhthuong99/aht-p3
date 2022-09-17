variable "name" {
}

variable "subnet_ids" {
  type = list(string)
}

variable "db_name" {

}
variable "db_user" {

}

variable "vpc_id" {

}
variable "db_password" {

}

variable "allowed_sgs" {

}
variable "db_instance_type" {
  default = "db.t3.micro"
}
variable "db_engine" {
  default = "mysql"
}

variable "db_engine_version" {
  default = "8.0.28"
}

variable "parameter_group_name" {
  default = "default.mysql8.0"

}

variable "storage_type" {
  default = "gp2"
}

variable "allocated_storage" {
  default = 10
}

variable "skip_final_snapshot" {
  default = true
}