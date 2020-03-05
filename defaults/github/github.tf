provider "github" {
  version = "~> 2.4.1"

  organization = "DataBiosphere"
  token = ""
}

module "repository" {
  source = "innovationnorway/repository/github"

  name           = var.repo_name
  description    = var.repo_description
  default_branch = "dev"

  allow_merge_commit = false
  allow_rebase_merge = false
  allow_squash_merge = true

  branch_protection = [{
    branch = "dev"

    enforce_admins         = true
    required_status_checks = {
      contexts = var.required_status_checks
    }
  }]

  has_issues   = false
  has_projects = false

  teams = [{
    name       = "terra-devs"
    permission = "push"
  }]
}
