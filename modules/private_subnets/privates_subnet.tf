### Create private subnets
resource "aws_subnet" "private_subnets" {
  count = "${length(var.aws_availability_zones)}"

  vpc_id            = "${var.vpc_id}"
  availability_zone = "${element(var.aws_availability_zones, count.index)}"
  cidr_block        = "${element(var.private_subnets_cidrs, count.index)}"

  tags {
    Name        = "private_subnet_${replace(element(var.aws_availability_zones, count.index), "-", "_")}"
    Env         = "${var.env}"
    Project     = "${var.project}"
    Subnet_type = "private"
  }
}

### Create route tables coresponding to private subnets
resource "aws_route_table" "private" {
  count = "${length(var.aws_availability_zones)}"

  vpc_id = "${var.vpc_id}"

  tags {
    Name       = "private_route_${replace(element(var.aws_availability_zones, count.index), "-", "_")}"
    Env        = "${var.env}"
    Project    = "${var.project}"
    Route_type = "private"
  }
}

### Associate a route table and a subnet
resource "aws_route_table_association" "private" {
  count = "${length(var.aws_availability_zones)}"

  subnet_id      = "${element(aws_subnet.private_subnets.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private.*.id, count.index)}"
}
