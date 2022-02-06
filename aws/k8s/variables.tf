variable "cluster_name" {}
variable "region" {}
variable "env0_values" {}
variable "customer_values" {}
variable "vpc" {
  default = {
    create = true
    vpc_id = ""
    private_subnets = []
  }
}

variable "eks" {
  default = {
    create = true
    kubernetes_host = ""
    cluster_id      = ""
  }
}

variable "efs" {
  default = {
    create = true
    efs_id = ""
  }
}


variable "create_autoscaler" {
  type = bool
  default = true
}

variable "create_csi_driver" {
  type = bool
  default = true
}
