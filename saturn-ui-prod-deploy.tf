module "saturn-ui-prod-deploy-repo" {
  source = "./defaults/github"

  repo_name        = "saturn-ui-prod-deploy"
  repo_description = "Terra UI automated prod deploy service"
  codeowner_team   = "SaturnDeployers"
}
