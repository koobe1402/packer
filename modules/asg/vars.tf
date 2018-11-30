variable "function" {}

variable "env" {}

variable "project" {}

variable "ami_id" {}

variable "subnets_ids" {
  type = "list"
}

variable "security_group" {}

variable "associate_public_ip_address" {
  default = "False"
}

variable "instance_type" {}

variable "asg_max_size" {}

variable "asg_min_size" {}

variable "asg_desired_capacity" {}

variable "ec2_key_name" {}

