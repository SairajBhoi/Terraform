resource "aws_subnet" "example_public_subnet" {
  vpc_id     = var.vpc_id
  cidr_block = var.cidr_block
  availability_zone = var.availability_zone
   tags = {
    Name = "public_subnet_s"

  }
}

output "subnet_id" {
  value = aws_subnet.example_public_subnet.id
}
