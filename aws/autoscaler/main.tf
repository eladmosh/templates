module "my_autoscaler" {
  source = "github.com/env0/k8s-modules//autoscaler/aws/efs?ref=chore-add-modules-params"

  cluster_name    = var.cluster_name
}
