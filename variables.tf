variable "name" {}

variable "repository_name" {}

variable "variables" {
  type     = map(string)
  default  = {}
  nullable = false
}

variable "secrets" {
  type     = map(string)
  default  = {}
  nullable = false
}