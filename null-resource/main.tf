resource "null_resource" "null1" {
}

resource "null_resource" "null3" {
}

resource "random_string" "random" {
  length           = 16
  special          = true
  override_special = "/@£$"
}

variable "DWARF" {
    type        = string
    default = "Oin"
    description = "my little dwarf"
}
