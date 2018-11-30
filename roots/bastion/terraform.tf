terraform {
  required_version = "0.11.10"

  backend "s3" {
    bucket  = "state-production-108519165709"
    region  = "eu-west-1"
    key     = "bastion.terraform_state"
    encrypt = "true"
  }
}
