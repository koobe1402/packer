output "private_subnets_ids" {
  value = "${aws_subnet.private_subnets.*.id}"
}

output "aws_private_route_tables_ids" {
  value = "${aws_route_table.private.*.id}"
}
