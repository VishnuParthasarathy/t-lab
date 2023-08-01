data "aws_ami" "web_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "web" {
  ami               = data.aws_ami.web_ami.id
  instance_type     = var.instanceType
  availability_zone = var.az[count.index]
  security_groups   = var.web_sg_ports
  count             = var.instanceCount
  tags = {
    Name = var.hostName[count.index]
  }
}