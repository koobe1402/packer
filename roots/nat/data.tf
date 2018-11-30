data "terraform_remote_state" "network" {
  backend = "s3"

  config {
    bucket = "state-production-108519165709"
    region = "eu-west-1"
    key    = "network.terraform_state"
  }
}
