/*variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default  = "us-east-1"
}*/

variable "vpc_id" {
  description = "VPC ID where resources will be deployed"
  type        = string
  default        = "vpc-078f4e4e19be926d2"

}

variable "subnet_ids" {
  description = "List of subnet IDs for ALB and EC2"
  type        = list(string)
  default = ["subnet-04a3d5c773d6d1aac", "subnet-0012df981333dad21" ]
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default        = "ami-084568db4383264d4"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.medium"
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
  default      = "Hcl-prac-training"
}
