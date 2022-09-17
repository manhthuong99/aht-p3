terraform {
  backend "s3" {
    bucket  = "thuongnm-aht-practice-03"
    key     = "Production/terraform.tfstate"
    region  = "ap-southeast-1"
    encrypt = true
  }
}

data "terraform_remote_state" "global" {
  backend = "s3"
  config = {
    bucket  = "thuongnm-aht-practice-03"
    key     = "global/terraform.tfstate"
    region  = "ap-southeast-1"
    encrypt = true
  }
}

