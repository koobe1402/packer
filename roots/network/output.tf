output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "public_subnets_ids" {
  value = "${module.public_subnets.public_subnets_ids}"
}

output "aws_private_route_tables_ids" {
  value = "${module.private_subnets.aws_private_route_tables_ids}"
}
