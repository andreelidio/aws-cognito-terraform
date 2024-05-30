#############
# Backend
#############
terraform {
  backend "s3" {
    bucket = "aeos-dev-terraform-state"
    key    = "resources/cognito/terraform.tfstate"
    region = "us-east-1"
  }
}