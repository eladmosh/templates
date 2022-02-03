module "my_efs" {
  source = "github.com/env0/k8s-modules//aws/efs?ref=chore-add-modules-params"

  cluster_name    = var.cluster_name
  region          = var.region
  vpc_id          = var.vpc_id
  subnets         = var.subnets
}
