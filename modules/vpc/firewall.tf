# =============================================================================
# FIREWALL RULES
# =============================================================================

# Allow internal traffic within the VPC
resource "google_compute_firewall" "default_allow_internal" {
  name    = "default-allow-internal"
  network = google_compute_network.vpc.name
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "icmp"
  }

  source_ranges = ["10.0.0.0/8"]
  priority      = 65534
}

# Allow SSH access from anywhere
resource "google_compute_firewall" "default_allow_ssh" {
  name    = "default-allow-ssh"
  network = google_compute_network.vpc.name
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  priority      = 65534
}

# Allow RDP access from anywhere
resource "google_compute_firewall" "default_allow_rdp" {
  name    = "default-allow-rdp"
  network = google_compute_network.vpc.name
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  source_ranges = ["0.0.0.0/0"]
  priority      = 65534
}

# Allow ICMP (ping) from anywhere
resource "google_compute_firewall" "default_allow_icmp" {
  name    = "default-allow-icmp"
  network = google_compute_network.vpc.name
  project = var.project_id

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
  priority      = 65534
}
