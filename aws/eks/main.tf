module "my_eks" {
  source = "github.com/env0/k8s-modules//aws/eks?ref=chore-add-modules-params"

  cluster_name    = var.cluster_name
  vpc_id          = var.vpc_id
}
