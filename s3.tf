terraform {
  backend "s3" {
    bucket = "remote-locate-terraform-state-bucket"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}

