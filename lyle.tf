module "lyle-repo" {
  source = "./defaults/github"

  repo_name        = "lyle"
  repo_description = ""
}

module "lyle-service" {
  source = "./defaults/gcp"

  google_project    = "terra-lyle"
  requires_suitable = false
}
