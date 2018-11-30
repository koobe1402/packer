module "vpc" {
  source   = "../../modules/vpc"
  vpc_cidr = "${var.vpc_cidr}"
  env      = "${var.env}"
  project  = "${var.project}"
}

module "public_subnets" {
  source = "../../modules/public_subnets"

  vpc_id               = "${module.vpc.vpc_id}"
  igw_id               = "${module.vpc.igw_id}"
  public_subnets_cidrs = "${var.public_subnets_cidrs}"

  env                    = "${var.env}"
  project                = "${var.project}"
  aws_availability_zones = "${var.aws_availability_zones}"
}

module "private_subnets" {
  source = "../../modules/private_subnets"

  vpc_id                = "${module.vpc.vpc_id}"
  private_subnets_cidrs = "${var.private_subnets_cidrs}"

  env                    = "${var.env}"
  project                = "${var.project}"
  aws_availability_zones = "${var.aws_availability_zones}"
}
