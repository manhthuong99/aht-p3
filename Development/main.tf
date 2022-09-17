module "ec2_development" {
  source        = "../modules/Server"
  name          = "aht-practice-03-server-dev"
  vpc_id        = data.terraform_remote_state.global.outputs.vpc_id
  subnet_id     = data.terraform_remote_state.global.outputs.subnet_ids[0]
  public_key    = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDzqNhOwfZDcTi2s00NYChZ9dL4nGWZ3t1o3Y9X/Rxq3oDDQzIbdPvpFKVPY9aHdOZid0I7rLlL8gSB6/YxuM7FdymHZUg4mmParXkdiHwH12siuz/HEa5wK4ssHgAVcAwwGLlPMzXbcNs0WvWvI0+vxHDZTyCKkBPWfMF8ey4Czx3c9EW5vJaZGtVtu88fzVO8t/KXSq71SBpmSKWvNIYXPaiEN/3zs3pVWlqqoYKHQ1TIo9WCHMfq/nOLbj/ddpYCPgLYks1mIpQLWL7GtpZz5725iGa2n/qf1gvavoqvFnv048hSkj3kHZo2wYDdPEPtdDfeyq3ImcxPY9skN3VF8scvsGlIb+n+U92K7JhYCXNfnP29Kzh3vQ1xBAfjLGEnvs96jeeehOJGgL5YPyoc1jIN6I+6e08X4BGikNLpvZ9dptMsKqSWqg809K0mB0Qp77FPx62xJjrtcTK+A0NWy9PZoeSRFw197AI/koay4SjsVw+yNFyy3AgjMT5hq6k= thuongnm@aht.local@CAS-008"
  instance_type = "t3.micro"
  allowed_ips   = ["222.252.30.29/32"]
}

module "rds_development" {
  source      = "../modules/RDS"
  name        = "aht-practice-03-rds-dev" #low case only
  subnet_ids  = data.terraform_remote_state.global.outputs.subnet_ids
  vpc_id      = data.terraform_remote_state.global.outputs.vpc_id
  db_name     = "aht_p3"
  db_user     = "thuongnm"
  db_password = "Vippro123"
  allowed_sgs = [module.ec2_development.security_group_id]
}


