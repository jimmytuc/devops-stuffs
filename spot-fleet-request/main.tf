resource "aws_spot_fleet_request" "spot_fleet_request" {

  iam_fleet_role = "${var.iam_fleet_role}"
  target_capacity = "${var.target_capacity}"
  allocation_strategy = "${var.allocation_strategy}"
  spot_price = "${var.spot_price}"
  wait_for_fulfillment = "${var.wait_for_fulfillment}"
  instance_interruption_behaviour = "${var.instance_interruption_behaviour}"
  excess_capacity_termination_policy = "${var.excess_capacity_termination_policy}"

  launch_specification {
    ami = "${var.ami_id}"
    instance_type = "${var.instance_type}"
    iam_instance_profile = "${var.iam_instance_profile}"
    associate_public_ip_address = "${var.associate_public_ip_address}"
    vpc_security_group_ids = ["${var.aws_security_groups["backend-pro"]}"]
    spot_price = "${var.spot_price}"
    key_name  = "${var.env == "production" ? var.key_names["production"] : var.key_names["qa"]}"
    subnet_id = "${var.env == "production" ? var.aws_subnets["iprice-prod-backend-a"] : var.aws_subnets["iprice-qa-a"]}"
    monitoring = "${var.monitoring}"
    ebs_optimized = "${var.ebs_optimized}"
    user_data = "${var.user_data}"
    availability_zone = "${var.availability_zone}"
    root_block_device {
      volume_size = "${var.root_ebs["volume_size"]}"
      volume_type = "${var.root_ebs["volume_type"]}"
    }
    tags {
      Name = "${var.instance_name}"
      Env = "${var.env}"
      App = "${var.app_name}"
      InstanceType = "spot"
    }
  }
}
