module "saturn-ui-prod-deploy-repo" {
  source = "./defaults/github"

  repo_name        = "saturn-ui-prod-deploy"
  repo_description = "Terra UI automated prod deploy service"
#  need to not add all of saturn-dev to this one since it's prod
}
