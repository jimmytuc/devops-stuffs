variable "aws_region" {
  description = "EC2 Region for the VPC"
  default = "ap-southeast-1"
}

variable "availability_zone" {
  description = "The AZ to start the instance in"
  default     = "ap-southeast-1a"
}

variable "aws_subnets" {
  type = "map"
  default = {
    "iprice-qa-a" = "subnet-"
    "iprice-prod-backend-a" = "subnet-"
  }
}

variable "aws_security_groups" {
  type = "map"
  default = {
    "backend-pro" = "sg-"
  }
}

variable "iam_instance_profile" {
  default = "iam-role"
}

variable "key_names" {
  type = "map"
  default = {
    "qa" = "identity.pem.pub"
    "production" = "identity.pem.pub"
  }
}

variable "associate_public_ip_address" {
  default = true
}

variable "spot_price" {
  default = "0.01"
  type    = "string"
  description = "The maximum hourly price (bid) you are willing to pay for the instance, e.g. 0.10"
}

variable "iam_fleet_role" {
  type = "string"
  default = "arn:aws:iam:role/aws-service-role/spotfleet.amazonaws.com/AWSServiceRoleForEC2SpotFleet"
  description = "Grants the Spot fleet permission to terminate Spot instances"
}

variable "target_capacity" {
  default = "1"
  type = "string"
  description = "The number of units to request"
}

variable "allocation_strategy" {
  default = "lowestPrice"
  type = "string"
  description = "Indicates how to allocate the target capacity across the Spot pools specified by the Spot fleet request. Default is lowestPrice"
}

variable "monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  default     = false
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  default     = false
}

variable "root_ebs" {
  type = "map"

  default = {
    "volume_size" = "8"
    "volume_type" = "gp2"
  }
}

variable "instance_interruption_behaviour" {
  type = "string"
  default = "terminate"
}

variable "wait_for_fulfillment" {
  default = true
}

variable "excess_capacity_termination_policy" {
  default = "Default"
  description = "expected excess_capacity_termination_policy to be one of [Default NoTermination]"
}

variable "user_data" {
  description = "The user data to provide when launching the instance"
  default     = ""
}

variable "image_tag" {}

variable "instance_name" {}

variable "app_name" {}

variable "instance_type" {
  default = "t2.micro"
}

variable "env" {}
variable "newrelic_license" {}
