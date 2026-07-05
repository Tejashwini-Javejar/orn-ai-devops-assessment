module "vpc" {
  source = "./modules/vpc"
}

module "iam" {
  source = "./modules/iam"
}

module "security_group" {
  source = "./modules/security-group"
  vpc_id = module.vpc.vpc_id
}

module "eks" {
  source = "./modules/eks"

  cluster_name = var.cluster_name
  subnet_ids   = module.vpc.private_subnets

  cluster_role_arn = module.iam.cluster_role_arn
}
