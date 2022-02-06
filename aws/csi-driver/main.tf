module "my_csi-driver" {
  source = "github.com/env0/k8s-modules//aws/csi-driver?ref=chore-add-modules-params"

  cluster_name    = var.cluster_name
  efs_id          = var.efs_id
}
