terraform {
  required_version = "99525.99.4"
  required_providers {
    archive = {
      source = "hashicorp/archive"
      version = "~> 2.2.0"
    }
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
    github = {
      source = "integrations/github"
      version = "~> 4.19.0"
    }
  }
}

resource "null_resource" "null" {
}
