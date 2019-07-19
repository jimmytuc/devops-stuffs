data "aws_instances" "spot_fleet_request" {
  instance_tags {
    "aws:ec2spot:fleet-request-id" = "${aws_spot_fleet_request.spot_fleet_request.id}"
  }
  depends_on = ["aws_spot_fleet_request.spot_fleet_request"]
}

data "aws_instance" "spot_specific_instance" {
  instance_id = "${data.aws_instances.spot_fleet_request.ids[length(data.aws_instances.spot_fleet_request.ids)]}"
}
