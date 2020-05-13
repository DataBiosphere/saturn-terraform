##### CONSTANTS

locals {
  ci_sa_roles = [
    "roles/appengine.deployer",
    "roles/appengine.serviceAdmin",
    "roles/cloudbuild.builds.builder"
  ]
}

##### SETUP

provider "google" {
  version = "~> 3.20"

  project = var.google_project
  region  = "us-central"

  credentials = var.google_credentials
}

##### ENABLE APIS

resource "google_project_service" "iam_api" {
  service = "iam.googleapis.com"
}

##### SERVICE ACCOUNTS

resource "google_service_account" "circleci" {
  account_id   = "circleci"
  display_name = "CircleCI"
}

##### ROLE ASSIGNMENTS

resource "google_project_iam_member" "ci_sa_iam" {
  count   = length(local.ci_sa_roles)
  project = var.google_project
  role    = local.ci_sa_roles[count.index]
  member  = "serviceAccount:${google_service_account.circleci.email}"
}

module "project-iam-bindings" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "~> 6.1"

  projects = [var.google_project]
  mode     = "additive"

  bindings = {
    "roles/owner" = var.requires_suitable ? [] : ["group:saturn-dev@broadinstitute.org"]
  }
}
