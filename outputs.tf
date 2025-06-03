output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "security_group_id" {
  value = module.security_group.sg_id
}