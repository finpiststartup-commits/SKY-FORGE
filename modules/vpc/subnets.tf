# =============================================================================
# SUBNETS
# =============================================================================

# Web Subnet
resource "google_compute_subnetwork" "subnet_web" {
  name          = "development-web"
  ip_cidr_range = var.subnet_web_cidr
  network       = google_compute_network.vpc.id
  region        = var.region
  project       = var.project_id
}

# Data Subnet
resource "google_compute_subnetwork" "subnet_data" {
  name          = "development-data"
  ip_cidr_range = var.subnet_data_cidr
  network       = google_compute_network.vpc.id
  region        = var.region
  project       = var.project_id
}

# API Subnet
resource "google_compute_subnetwork" "subnet_api" {
  name          = "development-api"
  ip_cidr_range = var.subnet_api_cidr
  network       = google_compute_network.vpc.id
  region        = var.region
  project       = var.project_id
}
