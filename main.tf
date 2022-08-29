locals {
  region = "us-east-1"
  sub_region = "us-east-1b"
}

provider "aws" {
  region = local.region
  profile = "default"
  shared_credentials_files = ["/Users/tzumby/.aws/credentials"]
  shared_config_files = ["/Users/tzumby/.aws/config"]
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "ethereum-infrastructure"
  }
}
