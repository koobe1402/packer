### Create a VPC
resource "aws_vpc" "vpc" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_support   = 1
  enable_dns_hostnames = 1

  tags {
    Name    = "${var.project}_vpc"
    Env     = "${var.env}"
    Project = "${var.project}"
  }
}

### Create Internet Gateway and attach it to the VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name    = "${var.project}_igw"
    Env     = "${var.env}"
    Project = "${var.project}"
  }
}
