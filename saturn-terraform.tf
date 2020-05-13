module "saturn-terraform-repo" {
  source       = "./defaults/github"
  github_token = var.github_token

  repo_name                      = saturn-terraform
  repo_description               = "Terraform definitions for all Saturn-managed repos and GCS projects"
  require_circle_build_for_merge = false
}
