module "my-cluster" {
  source = "github.com/env0/k8s-modules//aws?ref=chore-add-modules-params"
  #source = "github.com/env0/k8s-modules//aws"

  region            = var.region
  cluster_name      = var.cluster_name
  modules_info      = var.modules_info
}
