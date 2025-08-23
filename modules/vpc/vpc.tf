# =============================================================================
# VPC NETWORK
# =============================================================================

resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  description            = var.vpc_description
  auto_create_subnetworks = false
  mtu                    = var.vpc_mtu
  project                = var.project_id
}
