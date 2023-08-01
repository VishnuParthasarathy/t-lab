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

resource "aws_security_group" "dynamicsg" {
  name        = "web-hosts-sg"
  description = "Ingress from LB"

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
    for_each = var.db_sg_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}