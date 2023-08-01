variable "lb_sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [80, 443]
}

variable "web_sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [80, 443]
}

variable "db_sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [80, 443]
}

resource "aws_security_group" "lb_sg" {
  name        = "lb-sg"
  description = "Ingress from Internet"

  dynamic "ingress" {
    for_each = var.lb_sg_ports
    content {
      from_port   = 0
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "egress" {
    for_each = var.lb_sg_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

resource "aws_security_group" "web_sg" {
  name        = "lb-sg"
  description = "Ingress from Internet"

  dynamic "ingress" {
    for_each = var.web_sg_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "egress" {
    for_each = var.web_sg_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

resource "aws_security_group" "db_sg" {
  name        = "lb-sg"
  description = "Ingress from Internet"

  dynamic "ingress" {
    for_each = var.db_sg_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "egress" {
    for_each = var.db_sg_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}