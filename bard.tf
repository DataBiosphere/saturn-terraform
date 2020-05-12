module "bard-repo" {
  source       = "./defaults/github"
  github_token = var.github_token

  repo_name        = "bard"
  repo_description = "Metrics collection service"
}

module "bard-dev" {
  source             = "./defaults/gcp"
  google_credentials = var.google_credentials
  google_project     = "terra-bard-dev"
  requires_suitable  = false
}

module "bard-alpha" {
  source             = "./defaults/gcp"
  google_credentials = var.google_credentials
  google_project     = "terra-bard-alpha"
  requires_suitable  = false
}

module "bard-perf" {
  source             = "./defaults/gcp"
  google_credentials = var.google_credentials
  google_project     = "terra-bard-perf"
  requires_suitable  = false
}

module "bard-staging" {
  source             = "./defaults/gcp"
  google_credentials = var.google_credentials
  google_project     = "terra-bard-staging"
  requires_suitable  = false
}

module "bard-prod" {
  source             = "./defaults/gcp"
  google_credentials = var.google_credentials
  google_project     = "terra-bard-prod"
  requires_suitable  = true
}
