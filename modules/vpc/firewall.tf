# =============================================================================
# FIREWALL RULES
# =============================================================================

# Allow internal traffic within the VPC
resource "google_compute_firewall" "default_allow_internal" {
  name        = "default-allow-internal"
  description = "Allow internal traffic between subnets for common application ports"
  network     = google_compute_network.vpc.name
  project     = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "8080", "3000", "5432", "6379", "27017"]
  }
  allow {
    protocol = "udp"
    ports    = ["53", "123"]
  }
  allow {
    protocol = "icmp"
  }

  source_ranges = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24"]
  priority      = 1000
}

# Allow SSH access from authorized IP ranges only
resource "google_compute_firewall" "default_allow_ssh" {
  name        = "default-allow-ssh"
  description = "Allow SSH access from authorized IP ranges only"
  network     = google_compute_network.vpc.name
  project     = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["10.0.0.0/8"]
  target_tags   = ["ssh-enabled"]
  priority      = 1000
}

# Allow RDP access from authorized IP ranges only
resource "google_compute_firewall" "default_allow_rdp" {
  name        = "default-allow-rdp"
  description = "Allow RDP access from authorized IP ranges only"
  network     = google_compute_network.vpc.name
  project     = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  source_ranges = ["10.0.0.0/8"]
  target_tags   = ["rdp-enabled"]
  priority      = 1000
}

# Allow database traffic from API and web subnets
resource "google_compute_firewall" "default_allow_icmp" {
  name        = "allow-database"
  description = "Allow database traffic from API and web subnets"
  network     = google_compute_network.vpc.name
  project     = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["5432", "6379", "27017", "3306"]
  }

  source_ranges = ["10.10.0.0/24", "10.10.2.0/24"]
  target_tags   = ["database-server"]
  priority      = 1000
}
