# =============================================================================
# VPC MODULE OUTPUTS
# =============================================================================

# VPC Outputs
output "vpc_id" {
  description = "The ID of the VPC"
  value       = google_compute_network.vpc.id
}

output "vpc_name" {
  description = "The name of the VPC"
  value       = google_compute_network.vpc.name
}

output "vpc_self_link" {
  description = "The self-link of the VPC"
  value       = google_compute_network.vpc.self_link
}

output "vpc_gateway_ipv4" {
  description = "The gateway IPv4 address of the VPC"
  value       = google_compute_network.vpc.gateway_ipv4
}

# Subnet Outputs
output "subnet_web_id" {
  description = "The ID of the web subnet"
  value       = google_compute_subnetwork.subnet_web.id
}

output "subnet_web_name" {
  description = "The name of the web subnet"
  value       = google_compute_subnetwork.subnet_web.name
}

output "subnet_web_cidr" {
  description = "The CIDR range of the web subnet"
  value       = google_compute_subnetwork.subnet_web.ip_cidr_range
}

output "subnet_data_id" {
  description = "The ID of the data subnet"
  value       = google_compute_subnetwork.subnet_data.id
}

output "subnet_data_name" {
  description = "The name of the data subnet"
  value       = google_compute_subnetwork.subnet_data.name
}

output "subnet_data_cidr" {
  description = "The CIDR range of the data subnet"
  value       = google_compute_subnetwork.subnet_data.ip_cidr_range
}

output "subnet_api_id" {
  description = "The ID of the API subnet"
  value       = google_compute_subnetwork.subnet_api.id
}

output "subnet_api_name" {
  description = "The name of the API subnet"
  value       = google_compute_subnetwork.subnet_api.name
}

output "subnet_api_cidr" {
  description = "The CIDR range of the API subnet"
  value       = google_compute_subnetwork.subnet_api.ip_cidr_range
}

# Firewall Outputs
output "firewall_rules" {
  description = "List of firewall rule names"
  value = [
    google_compute_firewall.default_allow_internal.name,
    google_compute_firewall.default_allow_ssh.name,
    google_compute_firewall.default_allow_rdp.name,
    google_compute_firewall.default_allow_icmp.name
  ]
}

output "firewall_rule_ids" {
  description = "Map of firewall rule names to IDs"
  value = {
    internal = google_compute_firewall.default_allow_internal.id
    ssh      = google_compute_firewall.default_allow_ssh.id
    rdp      = google_compute_firewall.default_allow_rdp.id
    icmp     = google_compute_firewall.default_allow_icmp.id
  }
}

# Summary Outputs
output "network_summary" {
  description = "Summary of the network infrastructure"
  value = {
    vpc_name = google_compute_network.vpc.name
    vpc_id   = google_compute_network.vpc.id
    subnets = {
      web  = google_compute_subnetwork.subnet_web.name
      data = google_compute_subnetwork.subnet_data.name
      api  = google_compute_subnetwork.subnet_api.name
    }
    firewall_rules_count = 4
    region               = var.region
    project_id           = var.project_id
  }
}
