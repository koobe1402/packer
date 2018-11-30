resource "aws_security_group" "bastion_sg" {
  name        = "${var.function}_sg"
  description = "Security Grouop attached to bastion Instance"
  vpc_id      = "${data.terraform_remote_state.network.vpc_id}"

  tags {
    Name    = "${var.function}_asg"
    Env     = "${var.env}"
    Project = "${var.project}"
  }
}

resource "aws_security_group_rule" "allow_ssh" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.bastion_sg.id}"
}
