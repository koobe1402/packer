variable "project" {}

variable "env" {}

variable "aws_availability_zones" {
  type = "list"
}

variable "private_subnets_cidrs" {
  type = "list"
}

variable "vpc_id" {}

