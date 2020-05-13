module "saturn-ui-prod-deploy-repo" {
  source       = "./defaults/github"
  github_token = var.github_token

  repo_name                      = "saturn-ui-prod-deploy"
  repo_description               = "Terra UI automated prod deploy service"
  require_circle_build_for_merge = false
  codeowner_team                 = "saturndeployers"
}
