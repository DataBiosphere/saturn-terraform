module "lyle-repo" {
  source = "./defaults/github"

  repo_name                      = "lyle"
  repo_description               = "Test user allocation service"
  require_circle_build_for_merge = true
}

module "lyle-service" {
  source = "./defaults/gcp"

  google_project    = "terra-lyle"
  requires_suitable = false
}
