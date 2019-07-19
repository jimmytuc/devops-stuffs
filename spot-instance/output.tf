output "instance_public_ip" {
  value = "${data.aws_instance.spot_specific_instance.public_ip}"
}

output "spot_request_state" {
  value = "${aws_spot_fleet_request.spot_fleet_request.spot_request_state}"
}

output "spot_instance_id" {
  value = "${aws_spot_fleet_request.spot_fleet_request.id}"
}
