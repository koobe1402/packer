module "bastion" {
  source = "../../modules/asg"

  function = "${var.function}"

  ami_id               = "${data.aws_ami.bastion_ami.id}"
  ec2_key_name         = "${var.ec2_key_name}"
  instance_type        = "${var.instance_type}"
  asg_min_size         = "${var.asg_min_size}"
  asg_max_size         = "${var.asg_max_size}"
  asg_desired_capacity = "${var.asg_desired_capacity}"

  subnets_ids                 = "${data.terraform_remote_state.network.public_subnets_ids}"
  security_group              = "${aws_security_group.bastion_sg.id}"
  associate_public_ip_address = "False"

  env     = "${var.env}"
  project = "${var.project}"
}
