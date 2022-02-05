module "my-cluster" {
  source = "github.com/env0/k8s-modules//aws?ref=chore-add-modules-params"
  #source = "github.com/env0/k8s-modules//aws"

  region            = var.region
  cluster_name      = var.cluster_name
  vpc               = var.vpc
  eks               = var.eks
  create_autoscaler = var.create_autoscaler
}
