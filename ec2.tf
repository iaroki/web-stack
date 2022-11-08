resource "tls_private_key" "web_key_pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "web_key_pair" {
  key_name   = "web-key"
  public_key = tls_private_key.web_key_pair.public_key_openssh
}

resource "local_file" "web_ssh_key" {
  filename = "${aws_key_pair.web_key_pair.key_name}.pem"
  content  = tls_private_key.web_key_pair.private_key_pem
}

resource "aws_instance" "web_instance" {
  count                = length(aws_subnet.web_subnet.*.id)
  ami                  = data.aws_ami.ubuntu.id
  instance_type        = var.instance_type
  subnet_id            = element(aws_subnet.web_subnet.*.id, count.index)
  security_groups      = [aws_security_group.web_sg.id, ]
  key_name             = "web-keypair"
  user_data            = file("userdata.sh")

  tags = {
    Name = "web-instance-${count.index}"
  }

  timeouts {
    create = "10m"
  }

}

resource "aws_eip" "web_eip" {
  count            = length(aws_instance.web_instance.*.id)
  instance         = element(aws_instance.web_instance.*.id, count.index)
  public_ipv4_pool = "amazon"
  vpc              = true

  tags = {
    Name = "web-eip-${count.index}"
  }
}

resource "aws_eip_association" "web_eip_association" {
  count         = length(aws_eip.web_eip)
  instance_id   = element(aws_instance.web_instance.*.id, count.index)
  allocation_id = element(aws_eip.web_eip.*.id, count.index)
}
