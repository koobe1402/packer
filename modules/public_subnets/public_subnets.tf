### Create public subnets
resource "aws_subnet" "public_subnets" {
  count = "${length(var.aws_availability_zones)}"

  vpc_id            = "${var.vpc_id}"
  availability_zone = "${element(var.aws_availability_zones, count.index)}"
  cidr_block        = "${element(var.public_subnets_cidrs, count.index)}"

  tags {
    Name        = "public_subnet_${replace(element(var.aws_availability_zones, count.index), "-", "_")}"
    Env         = "${var.env}"
    Project     = "${var.project}"
    Subnet_type = "public"
  }
}

### Create route tables coresponding to public subnets
resource "aws_route_table" "public" {
  count = "${length(var.aws_availability_zones)}"

  vpc_id = "${var.vpc_id}"

  tags {
    Name       = "public_route_${replace(element(var.aws_availability_zones, count.index), "-", "_")}"
    Env        = "${var.env}"
    Project    = "${var.project}"
    Route_type = "public"
  }
}

### Associate a public route table and a public subnet
resource "aws_route_table_association" "public" {
  count = "${length(var.aws_availability_zones)}"

  subnet_id      = "${element(aws_subnet.public_subnets.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.public.*.id, count.index)}"
}

### Add routes towards Internet Gateway in public subnets
resource "aws_route" "public_to_internet_gateway" {
  count = "${length(var.aws_availability_zones)}"

  route_table_id         = "${element(aws_route_table.public.*.id, count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${var.igw_id}"
}
