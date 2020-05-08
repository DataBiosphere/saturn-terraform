module "saturn-ui-prod-deploy-repo" {
  source = "./defaults/github"

  repo_name                      = "saturn-ui-prod-deploy"
  repo_description               = "Terra UI automated prod deploy service"
  require_circle_build_for_merge = false
  codeowner_team                 = "SaturnDeployers"
}
