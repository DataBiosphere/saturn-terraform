module "bard-repo" {
  source = "./defaults/github"

  repo_name        = "bard"
  repo_description = ""
}

module "bard-dev" {
  source = "./defaults/gcp"

  google_project    = "terra-bard-dev"
  requires_suitable = false
}

module "bard-alpha" {
  source = "./defaults/gcp"

  google_project    = "terra-bard-alpha"
  requires_suitable = false
}

module "bard-perf" {
  source = "./defaults/gcp"

  google_project    = "terra-bard-perf"
  requires_suitable = false
}

module "bard-staging" {
  source = "./defaults/gcp"

  google_project    = "terra-bard-staging"
  requires_suitable = false
}
