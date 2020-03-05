##### CONSTANTS

locals {
  ci_sa_roles = [
    "roles/appengine.deployer",
    "roles/appengine.serviceAdmin",
    "roles/cloudbuild.builds.builder"
  ]
}

##### SETUP

# billing account?
provider "google" {
  version = "~> 3.11"

  project = var.google_project
  region  = "us-central"

  credentials = file("${var.google_project}-key.json")
}

##### ENABLE APIS

resource "google_project_service" "iam_api" {
  service = "iam.googleapis.com"
}

##### SERVICE ACCOUNTS

resource "google_service_account" "circleci" {
  account_id   = "circleci"
  display_name = "CircleCi"
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
  project = var.google_project
  mode    = "additive"

  bindings = {
    "roles/owner" = var.requires_suitable ? [] : ["group:saturn-dev@broadinstitute.org"]
  }
}
