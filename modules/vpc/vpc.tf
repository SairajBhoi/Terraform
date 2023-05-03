resource "aws_vpc" "example_vpc" {
  cidr_block = var.cidr_block
   tags = {
    Name = "my_vpc"
  }
}

output "vpc_id" {
  value = aws_vpc.example_vpc.id
 
}
