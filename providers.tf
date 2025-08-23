# =============================================================================
# PROVIDER CONFIGURATION
# =============================================================================

# Provider for accessing Secret Manager (using default credentials)
provider "google" {
  alias   = "secret_manager"
  project = var.project_id
  region  = var.region
}

# Get the service account key from Secret Manager
data "google_secret_manager_secret_version" "service_account" {
  provider = google.secret_manager
  secret   = "finpist-terraform-dev-sa-key"
  project  = var.project_id
}

# Main provider using the retrieved credentials
provider "google" {
  credentials = data.google_secret_manager_secret_version.service_account.secret_data
  project     = var.project_id
  region      = var.region
}
