output "public_ip" {
  value = module.ec2_development.public_ip
}


output "db_endpoint" {
  value = module.rds_development.db_endpoint
}
