data "aws_ami" "bastion_ami" {
  most_recent = true
  name_regex  = "ubuntu-bionic-18.04-amd64-server-*"
  owners      = ["099720109477"]
}

data "terraform_remote_state" "network" {
  backend = "s3"

  config {
    bucket = "state-production-108519165709"
    region = "eu-west-1"
    key    = "network.terraform_state"
  }
}
