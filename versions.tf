# =============================================================================
# TERRAFORM VERSION CONSTRAINTS
# =============================================================================

terraform {
  required_version = ">= 1.0"
  
  # Backend configuration for remote state
  backend "gcs" {}
  
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}
