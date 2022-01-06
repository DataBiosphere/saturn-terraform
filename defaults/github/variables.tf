variable "repo_name" {
  type = string
}

variable "repo_description" {
  type = string
}

variable "require_circle_build_for_merge" {
  type    = bool
  default = true
}

variable "has_wiki" {
  type    = bool
  default = false
}

variable "codeowner_team" {
  type    = string
  default = "terra-ui-code-owners"
}

variable "github_token" {
  type = string
}
