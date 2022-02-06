module "my_autoscaler" {
  source = "github.com/env0/k8s-modules//aws/autoscaler?ref=chore-add-modules-params"

  cluster_name    = var.cluster_name
  efs_id          = var.efs_id
}
