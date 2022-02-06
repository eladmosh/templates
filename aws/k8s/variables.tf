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

variable "modules_info" {
  type = object({
    vpc = object({
      create = bool
      id = string
      private_subnets = list(string)
    })
    eks = object({
      create = bool
      cluster_id = string
    })
    efs = object ({
      create = bool
      id = string
    })
    autoscaler = object ({
      create = bool
    })
    csi_driver = object({
      create = bool
    })
  })

  default = {
    vpc = {
      create = true
      id = ""
      private_subnets = []
    }
    eks = {
      create = true
      cluster_id = ""
    }
    efs = {
      create = true
      id = ""
    }
    autoscaler = {
      create = true
    }
    csi_driver = {
      create = true
    }
  }
}
