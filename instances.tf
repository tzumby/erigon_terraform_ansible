resource "aws_instance" "ssh_bastion" {
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.public.id}"
  key_name      = "tzumby"

  associate_public_ip_address = true

  vpc_security_group_ids = [
    "${aws_security_group.sg_ssh_bastion.id}"
  ]

  tags = {
    Name  = "ssh_bastion"
  }
}

resource "aws_instance" "erigon_node" {
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t2.xlarge"
  subnet_id     = "${aws_subnet.public.id}"
  key_name      = "tzumby"

  associate_public_ip_address = true

  vpc_security_group_ids = [
    "${aws_security_group.sg_erigon_node.id}"
  ]

  tags = {
    Name  = "erigon_node"
  }

  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 1000
    volume_type = "gp2"
  }
}

resource "aws_instance" "metrics_node" {
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.public.id}"
  key_name      = "tzumby"

  associate_public_ip_address = true

  vpc_security_group_ids = [
    "${aws_security_group.sg_metrics_node.id}"
  ]

  tags = {
    Name  = "metrics_node"
  }

  root_block_device {
    volume_size = 30
  }
}
