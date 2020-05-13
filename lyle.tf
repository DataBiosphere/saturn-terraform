module "lyle-repo" {
  source       = "./defaults/github"
  github_token = var.github_token

  repo_name        = "lyle"
  repo_description = "Test user allocation service"
}

module "lyle-service" {
  source             = "./defaults/gcp"
  google_credentials = var.google_credentials
  google_project     = "terra-lyle"
  requires_suitable  = false
}
