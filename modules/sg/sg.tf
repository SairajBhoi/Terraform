
resource "aws_security_group" "example_sg" {
  name_prefix = "my_sg"
  vpc_id = var.vpc_id


  ingress {
    from_port = local.ssh
    to_port = local.ssh
    protocol = local.Protocol
    cidr_blocks = [local.cidr_blocks]
  }

  ingress {
    from_port = local.http
    to_port = local.http
    protocol = local.Protocol
    cidr_blocks = [local.cidr_blocks]
  }
ingress {
    from_port = local.https
    to_port = local.https
    protocol = local.Protocol
    cidr_blocks  = [local.cidr_blocks]
  }
egress {
    from_port = local.all
    to_port = local.all
    protocol = local.out_protocol
    cidr_blocks = [local.cidr_blocks]
  }
}

output "sg_id" {
  value = aws_security_group.example_sg.id
}


locals {
  ssh = 22
  http = 80
  https = 443
  all = 0
  out_protocol= "-1"
  Protocol = "tcp"
  cidr_blocks = "0.0.0.0/0"
}
