resource "null_resource" "null1" {
}

resource "null_resource" "null2" {
}

variable "dwarf" {
    type        = string
    description = "my little dwarf"
}

output "dwarf" {
  value = var.dwarf
}
