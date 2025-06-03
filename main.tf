module "security_group" {
  source = "./modules/security_group"
  vpc_id = var.vpc_id
}

module "ec2" {
  source             = "./modules/ec2"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  subnet_id          = var.subnet_ids[0]
  security_group_ids = [module.security_group.sg_id]
}

module "alb" {
  source             = "./modules/alb"
  vpc_id             = var.vpc_id
  subnet_ids         = var.subnet_ids
  instance_id        = module.ec2.instance_id
  security_group_ids = [module.security_group.sg_id]
}