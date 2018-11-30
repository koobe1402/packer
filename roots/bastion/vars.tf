variable "function" {
  default = "bastion"
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
  description = "EIP allocations used by bastion"
  type        = "map"

  default =
    {
      function           = "bastion"
      elastic_ip_address = "34.242.103.200"
      allocation_id      = "eipalloc-0e07969fe473ed940"
    }
}

variable "source_dest_check" {
  default = "False"
}
