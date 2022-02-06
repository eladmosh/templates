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

  validation {
    condition = !(var.modules_info.vpc.create == false && (var.modules_info.vpc.id == "" || length(var.modules_info.vpc.private_subnets) == 0))
    error_message = "You must specify vpc_id if and private_subnets you don't want the vpc to be created."
  }

  validation {
    condition = !(var.modules_info.eks.create == false && var.modules_info.eks.cluster_id == "")
    error_message = "You must specify cluster_id if you don't want the eks to be created."
  }

  validation {
    condition = !(!var.modules_info.eks.create && var.modules_info.vpc.create)
    error_message = "You can't provision eks without vpc."
  }

  validation {
    condition = !(!var.modules_info.efs.create && var.modules_info.efs.create)
    error_message = "You can't proviosn efs without eks."
  }

  validation {
    condition = !(!var.modules_info.autoscaler.create && var.modules_info.eks.create)
    error_message = "You can't proviosn autoscaler without eks."
  }

  validation {
    condition = !(!var.modules_info.csi_driver.create && var.modules_info.efs.create)
    error_message = "You can't proviosn csi_driver without efs."
  }
}
