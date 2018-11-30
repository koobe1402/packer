variable "project" {}

variable "env" {}

variable "aws_availability_zones" {
  type = "list"
}

variable "public_subnets_cidrs" {
  type = "list"
}

variable "vpc_id" {}

variable "igw_id" {}

