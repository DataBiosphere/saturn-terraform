module "rex-repo" {
  source = "./defaults/github"

  repo_name                      = "rex"
  repo_description               = "Survey response service"
}

module "rex-dev" {
  source = "./defaults/gcp"

  google_project    = "terra-rex-dev"
  requires_suitable = false
}

module "rex-alpha" {
  source = "./defaults/gcp"

  google_project    = "terra-rex-alpha"
  requires_suitable = false
}

module "rex-perf" {
  source = "./defaults/gcp"

  google_project    = "terra-rex-perf"
  requires_suitable = false
}

module "rex-staging" {
  source = "./defaults/gcp"

  google_project    = "terra-rex-staging"
  requires_suitable = false
}

module "rex-prod" {
  source = "./defaults/gcp"

  google_project    = "terra-rex-prod"
  requires_suitable = true
}
