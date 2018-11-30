variable "aws_availability_zones" {
  description = "AWS availability zones use by the project"
  type        = "list"
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

variable "function" {
  default = "nat"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "project" {
  default = "airwizard"
}

variable "env" {
  default = "integration"
}

variable "asg_min_size" {
  default = "1"
}

variable "asg_max_size" {
  default = "1"
}

variable "asg_desired_capacity" {
  default = "1"
}

variable "ec2_key_name" {
  default = "poc_personal"
}

variable "eip_allocations" {
  description = "EIP allocations used by project resources"
  type        = "map"

  default =
    {
      function           = "nat"
      elastic_ip_address = "63.33.140.46"
      allocation_id      = "eipalloc-0810bc4803c1ad8ff"
    }
}

variable "source_dest_check" {
  default = "True"
}
