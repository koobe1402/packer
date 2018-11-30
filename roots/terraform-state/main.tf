resource "aws_s3_bucket" "terraform_state" {
  bucket = "state-${var.env}-${var.aws_account}"
  acl    = "private"
  region = "${data.aws_region.current.name}"

  versioning = {
    enabled = true
  }

  tags {
    Name        = "state-${var.env}-${var.aws_account}"
    Environment = "${var.env}"
    Project     = "${var.project}"
  }
}

data "aws_region" "current" {
  current = true
}
