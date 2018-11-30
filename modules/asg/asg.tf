### Create a Launch Configuration
resource "aws_launch_configuration" "lc" {
  name_prefix                 = "${var.function}_lc_"
  image_id                    = "${var.ami_id}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.ec2_key_name}"
  security_groups             = ["${var.security_group}"]
  associate_public_ip_address = "${var.associate_public_ip_address}"

  lifecycle {
    create_before_destroy = true
  }
}

### Create an Auto Scaling Group
resource "aws_autoscaling_group" "asg" {
  name_prefix               = "${var.function}_asg_"
  max_size                  = "${var.asg_max_size}"
  min_size                  = "${var.asg_min_size}"
  desired_capacity          = "${var.asg_desired_capacity}"
  health_check_grace_period = 300
  health_check_type         = "EC2"
  force_delete              = false
  launch_configuration      = "${aws_launch_configuration.lc.name}"
  vpc_zone_identifier       = ["${var.subnets_ids}"]

  tags = [
    {
      key                 = "Name"
      value               = "${var.function}"
      propagate_at_launch = true
    },
    {
      key                 = "Env"
      value               = "${var.env}"
      propagate_at_launch = true
    },
    {
      key                 = "Project"
      value               = "${var.project}"
      propagate_at_launch = true
    },
  ]
}

