### This resource is creating only one NATGW in eu-west-1b.
### In case of eu-west-1b failure, all outbound traffic in this VPC will be cut off.
### This aspect is well understood and the risk is accepted due to pricing reasons.
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = "${lookup(var.eip_allocations, "allocation_id")}"
  subnet_id     = "${data.terraform_remote_state.network.public_subnets_ids[1]}"

  tags {
    Name    = "nat_gw_${replace(var.aws_availability_zones[1], "-", "_")}"
    Env     = "${var.env}"
    Project = "${var.project}"

    EIP_allocation_id = "${lookup(var.eip_allocations, "allocation_id")}"
  }
}

### Create routes from private subnets to NATGW
resource "aws_route" "private_to_nat_gateway" {
  count = "${length(data.terraform_remote_state.network.aws_private_route_tables_ids)}"

  route_table_id         = "${element(data.terraform_remote_state.network.aws_private_route_tables_ids, count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.nat_gw.id}"
}
