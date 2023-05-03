module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.cidr_block
}
module "subnet" {
  source            = "./modules/subnet"
  vpc_id            = module.vpc.vpc_id
  availability_zone = "${var.aws_region}a"
  cidr_block        = var.cidr_block
}


module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.vpc_id

}

module "routetable" {
  source = "./modules/routetable"
  vpc_id = module.vpc.vpc_id  
   gateway_id = module.igw.igw_id
  
}

module "route_table_association" {
  source = "./modules/route_table_association"
  subnet_id      = module.subnet.subnet_id
  route_table_id = module.routetable.public_rt_id
}


# module "elastic_ip" {
#   source = "./modules/elastic_ip"

# }



module "ec2" {
  source                 = "./modules/ec2"
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = module.subnet.subnet_id
  key_name               = var.key_name
  vpc_security_group_ids =[module.sg.sg_id]
}


module "network_interface" {
 source                 = "./modules/network_interface" 
 subnet_id       = module.subnet.subnet_id
 security_groups = [module.sg.sg_id]
}


module "sg" {
  source      = "./modules/sg"
  vpc_id      = module.vpc.vpc_id
}
