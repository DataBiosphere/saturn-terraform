module "saturn-ui-prod-deploy-repo" {
  source = "./defaults/github"

  repo_name        = "saturn-ui-prod-deploy"
  repo_description = ""
}
