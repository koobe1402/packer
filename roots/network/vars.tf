variable "aws_availability_zones" {
  description = "AWS availability zones use by the project"
  type        = "list"
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnets_cidrs" {
  description = "CIDR for the Public Subnets"
  type        = "list"
  default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets_cidrs" {
  description = "CIDR for the Private Subnets"
  type        = "list"
  default     = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
}

variable "project" {
  default = "airwizard"
}

variable "env" {
  default = "integration"
}

variable "eip_allocations" {
  description = "EIP allocations used by project resources"
  type        = "map"

  default = {
    function           = "nat"
    elastic_ip_address = "63.33.140.46"
    allocation_id      = "eipalloc-0810bc4803c1ad8ff"
  }
}
