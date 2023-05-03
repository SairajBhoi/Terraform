
# Associate route table with public subnet
resource "aws_route_table_association" "example_public_rta" {
  subnet_id      = var.subnet_id
  route_table_id = var.route_table_id
}
