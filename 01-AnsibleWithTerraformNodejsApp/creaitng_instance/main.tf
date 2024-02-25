module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.prefix}-vpc"
  cidr = var.vpc_cidr

  azs = data.aws_availability_zones.azs.names

  public_subnets          = var.public_subnets
  map_public_ip_on_launch = true
  enable_dns_hostnames    = true

  tags = {
    Name        = "${var.prefix}-vpc"
    Terraform   = "true"
    Environment = "Ansible-Development"
  }
  public_subnet_tags = {
    Name = "${var.prefix}-subnet"
  }
}

module "Ansible-SG" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "${var.prefix}-service"
  description = "Security group for ${var.prefix} server"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      description = "HTTP"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH port"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  tags = {
    Name = "${var.prefix}-SG"
  }
}
module "Ansible_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                        = "${var.prefix}-server"
  ami                         = data.aws_ami.aws_image_latest.id
  instance_type               = "t2.micro"
  key_name                    = "tf_key"
  monitoring                  = true
  vpc_security_group_ids      = [module.Ansible-SG.security_group_id]
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  availability_zone           = data.aws_availability_zones.azs.names[0]
  count                       = 2
  tags = {
    Name        = "ansible-server"
    Terraform   = "true"
    Environment = "${var.prefix}-Development"
  }
}