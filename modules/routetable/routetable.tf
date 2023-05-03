resource "aws_route_table" "example_public_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.gateway_id
  }
  tags = {
    Name = "public_route_table_s"

  }
}

output "public_rt_id" {
  value = aws_route_table.example_public_rt.id
}
