terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  token = var.github_token
}


variable "github_token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
}





resource "github_repository" "Lab_Tf" {
  name        = "Lab_Tf"
  description = "My awesome codebase"
  visibility = "public"
  auto_init      = true  # Esto crea automáticamente un README.md y la rama main
  default_branch = "main"
  
}


resource "github_branch" "development" {
  repository = github_repository.Lab_Tf.name
  branch     = "development"
}

resource "github_branch" "testing" {
  repository = github_repository.Lab_Tf.name
  branch     = "testing"
}

resource "github_branch" "playground" {
  repository = github_repository.Lab_Tf.name
  branch     = "playground"
}
