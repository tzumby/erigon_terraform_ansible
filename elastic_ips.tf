resource "aws_eip" "gw_ip" {
  vpc = true
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_eip" "bastion_ip" {
  vpc = true
  instance = aws_instance.ssh_bastion.id
}

resource "aws_eip" "metrics_ip" {
  vpc = true
  instance = aws_instance.metrics_node.id
}
