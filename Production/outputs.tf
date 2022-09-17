output "public_ip" {
  value = module.ec2_production.public_ip
}


output "db_endpoint" {
  value = module.rds_production.db_endpoint
}
