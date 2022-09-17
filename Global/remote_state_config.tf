terraform {
  backend "s3" {
    bucket = "thuongnm-aht-practice-03"
    key    = "global/terraform.tfstate"
    region = "ap-southeast-1"
    encrypt = true
  }
}

