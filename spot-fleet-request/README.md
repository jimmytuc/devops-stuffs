# Spot fleet request instance

## Required vars
### Instance and Spot fleet attributes:
- key_names: map
- aws_subnets: map
- aws_security_groups: map
- root_ebs: map
- aws_region: string
- ami_id: string
- spot_price: string
- iam_fleet_role: string
- iam_instance_profile: string
- target_capacity: string
- allocation_strategy: string
- instance_interruption_behaviour: string
- excess_capacity_termination_policy: string
- user_data: string
- monitoring: boolean
- ebs_optimized: boolean
- associate_public_ip_address: boolean
- wait_for_fulfillment: boolean

### Environments:
- instance_type: string
- image_tag: string
- instance_name: string
- app_name: string
- env: string
- newrelic_license: string

## Usage
```module "aws_spotfleet_request" {
    source = "git::https://github.com/iPrice/docker.git//spot-fleet-request"
    env = "${var.env}"
    iam_fleet_role = "${var.iam_fleet_role}"
    image_tag = "${var.image_tag}"
    instance_name = "${var.instance_name}"
    app_name = "${var.app_name}"
    ami_id = "${data.aws_ami.linux.id}"
    newrelic_license = "${var.newrelic_license}"
    instance_type = "${var.instance_type}"
}```
Refer: https://www.terraform.io/docs/modules/sources.html
