resource "aws_security_group" "sg_priv" {
  name = "sg_priv"
  description = "Private Security Group"
  vpc_id = "${aws_vpc.main.id}"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["${aws_subnet.private.cidr_block}"]
  }

  egress {
    from_port = 0
    to_port   = 65535
    protocol  = "tcp"
    cidr_blocks = ["${aws_subnet.private.cidr_block}"]
  }

  tags = {
    Name = "sg_priv"
  }
}

resource "aws_security_group" "sg_ssh_bastion" {
  name = "sg_ssh_bastion"
  description = "Allow ssh traffic into the ssh bastion instance"
  vpc_id = "${aws_vpc.main.id}"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_ssh_bastion"
  }
}

resource "aws_security_group" "sg_erigon_node" {
  name = "sg_erigon_node"
  description = "Allow http traffic into the erigon node instance"
  vpc_id = "${aws_vpc.main.id}"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["${aws_subnet.public.cidr_block}"]
  }

  ingress {
    from_port = 8545
    to_port   = 8545
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 42069
    to_port   = 42069
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 42069
    to_port   = 42069
    protocol  = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 30303
    to_port   = 30303
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 30303
    to_port   = 30303
    protocol  = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 6060
    to_port   = 6060
    protocol  = "tcp"
    cidr_blocks = [aws_subnet.public.cidr_block]
  }

  egress {
    from_port = 42069
    to_port   = 42069
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 42069
    to_port   = 42069
    protocol  = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 30303
    to_port   = 30303
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 30303
    to_port   = 30303
    protocol  = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_erigon_node"
  }
}

resource "aws_security_group" "sg_metrics_node" {
  name = "sg_metrics_node"
  description = "Allow http traffic into the metrics node instance"
  vpc_id = "${aws_vpc.main.id}"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = [aws_subnet.public.cidr_block]
  }

  ingress {
    from_port = 3000
    to_port   = 3000
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 6060
    to_port   = 6060
    protocol  = "tcp"
    cidr_blocks = [aws_subnet.public.cidr_block]
  }

  egress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_metrics_node"
  }
}
