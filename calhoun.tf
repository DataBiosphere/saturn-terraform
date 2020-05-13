module "calhoun-repo" {
  source       = "./defaults/github"
  github_token = var.github_token

  repo_name                      = "calhoun"
  repo_description               = "Notebook preview service"
  require_circle_build_for_merge = false
}

module "calhoun-dev" {
  source             = "./defaults/gcp"
  google_credentials = var.google_credentials
  google_project     = "terra-calhoun-dev"
  requires_suitable  = false
}

module "calhoun-alpha" {
  source             = "./defaults/gcp"
  google_credentials = var.google_credentials
  google_project     = "terra-calhoun-alpha"
  requires_suitable  = false
}

module "calhoun-perf" {
  source             = "./defaults/gcp"
  google_credentials = var.google_credentials
  google_project     = "terra-calhoun-perf"
  requires_suitable  = false
}

module "calhoun-staging" {
  source             = "./defaults/gcp"
  google_credentials = var.google_credentials
  google_project     = "terra-calhoun-staging"
  requires_suitable  = false
}

module "calhoun-prod" {
  source             = "./defaults/gcp"
  google_credentials = var.google_credentials
  google_project     = "terra-calhoun-prod"
  requires_suitable  = true
}
