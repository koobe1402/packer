### Create a NAT Gateway
resource "aws_nat_gateway" "nat_gws" {

  allocation_id = "${lookup(var.natgw_eip_allocations, "allocation_id")}"
  subnet_id     = "${var.public_subnets_ids}"

  tags {
    Name    = "nat_gw_${replace(element(var.aws_availability_zones, count.index), "-", "_")}"
    Env     = "${var.env}"
    Project = "${var.project}"

    EIP_allocation_id = "${lookup(var.natgw_eip_allocations[count.index], "allocation_id")}"
  }
}
