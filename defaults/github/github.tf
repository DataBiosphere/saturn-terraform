provider "github" {
  version = "~> 2.7"

  token        = var.github_token
  organization = "DataBiosphere"
}

resource "github_repository" "main" {
  name           = var.repo_name
  description    = var.repo_description
  default_branch = "dev"

  allow_merge_commit     = false
  allow_rebase_merge     = false
  allow_squash_merge     = true
  delete_branch_on_merge = true

  has_issues   = false
  has_projects = false
  has_wiki     = var.has_wiki
}

resource "github_branch_protection" "dev_protections" {
  repository = github_repository.main.name
  branch     = "dev"

  enforce_admins = true
  required_status_checks {
    contexts = var.require_circle_build_for_merge ? ["ci/circleci: build"] : []
  }
}


data "github_team" "codeowner_team" {
  slug = var.codeowner_team
}

resource "github_team_repository" "codeowner_permission" {
  team_id    = data.github_team.codeowner_team.id
  repository = github_repository.main.name
  permission = "push"
}
