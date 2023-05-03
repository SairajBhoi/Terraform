resource "aws_internet_gateway" "example_igw" {
  vpc_id = var.vpc_id
  tags = {
    Name = "my_igw"

  }
}
output "igw_id" {
  value =   aws_internet_gateway.example_igw.id
}
