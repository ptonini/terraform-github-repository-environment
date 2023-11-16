resource "github_repository_environment" "this" {
  environment = var.name
  repository  = var.repository_name
}

resource "github_actions_environment_variable" "this" {
  for_each      = var.variables
  repository    = github_repository_environment.this.repository
  environment   = github_repository_environment.this.environment
  variable_name = each.key
  value         = each.value
}

resource "github_actions_environment_secret" "this" {
  for_each        = var.secrets
  repository      = github_repository_environment.this.repository
  environment     = github_repository_environment.this.environment
  secret_name     = each.key
  plaintext_value = each.value
}

