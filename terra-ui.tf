module "terra-ui-repo" {
  source = "./defaults/github"

  repo_name        = "terra-ui"
  repo_description = "Web user interface for the Terra platform"
}

module "terra-ui-dev" {
  source             = "./defaults/gcp"
  google_credentials = var.google_credentials
  google_project     = "bvdp-saturn-dev"
  requires_suitable  = false
}

module "terra-ui-alpha" {
  source             = "./defaults/gcp"
  google_credentials = var.google_credentials
  google_project     = "bvdp-saturn-alpha"
  requires_suitable  = false
}

module "terra-ui-perf" {
  source             = "./defaults/gcp"
  google_credentials = var.google_credentials
  google_project     = "bvdp-saturn-perf"
  requires_suitable  = false
}

module "terra-ui-staging" {
  source             = "./defaults/gcp"
  google_credentials = var.google_credentials
  google_project     = "bvdp-saturn-staging"
  requires_suitable  = false
}

module "terra-ui-prod" {
  source             = "./defaults/gcp"
  google_credentials = var.google_credentials
  google_project     = "bvdp-saturn-prod"
  requires_suitable  = true
}
