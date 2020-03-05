variable "repo_name" {
  type = string
}

variable "repo_description" {
  type = string
}

variable "required_status_checks" {
  type    = list(string)
  default = []
}
