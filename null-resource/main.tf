variable "sensitive_var" {
  type = string
}

resource "null_resource" "null1" {
}

resource "null_resource" "null3" {
}

resource "random_string" "random" {
  length           = 16
  special          = true
  override_special = var.sensitive_var
}

variable "DWARF" {
    type        = string
    default = "Oin"
    description = "my little dwarf"
}
