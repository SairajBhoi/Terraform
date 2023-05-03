resource "aws_instance" "remote" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids = var.vpc_security_group_ids
   tags = {
    Name = "remote-node"
    }

provisioner "local-exec" {
  command = <<-EOT
      sudo apt-get update -y
      sudo apt-get install -y ansible
  EOT
}

# provisioner "local-exec" {
#   command = <<-EOT
#        echo "week ansible_host='${aws_instance.remote.public_ip}' ansible_connection=ssh ansible_user=ubuntu" >> /root/terraform/rst/inventory.ini
#   EOT
# }
# provisioner "local-exec" {
#   command = <<-EOT
#       ansible-playbook -i /root/terraform/rst/inventory.ini --private-key=~/.ssh/key.pem playbookweek.yaml
#   EOT
# }
}

