resource "aws_eip" "example_eip" {
  vpc = true
tags = {
    Name = "my_elastic_ip"
  }
}
