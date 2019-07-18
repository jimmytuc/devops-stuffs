terraform {
  backend "s3" {
    bucket = "backend-states-terraform"
    region = "ap-southeast-1"
    acl = "private"
  }
}
