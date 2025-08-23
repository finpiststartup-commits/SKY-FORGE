# =============================================================================
# MAIN TERRAFORM CONFIGURATION
# =============================================================================
# 
# This is the main entry point for the Terraform configuration.
# The actual resources are defined in separate modules:
# - modules/vpc: VPC, subnets, and firewall rules
#
# To apply this configuration:
# 1. terraform init
# 2. terraform plan
# 3. terraform apply
#
# To import existing resources:
# terraform import module.vpc.google_compute_network.vpc projects/finpist-dev/global/networks/finpist-dev-vpc
# terraform import module.vpc.google_compute_subnetwork.subnet_web projects/finpist-dev/regions/asia-south1/subnetworks/finpist-dev-web
# terraform import module.vpc.google_compute_subnetwork.subnet_data projects/finpist-dev/regions/asia-south1/subnetworks/finpist-dev-data
# terraform import module.vpc.google_compute_subnetwork.subnet_api projects/finpist-dev/regions/asia-south1/subnetworks/finpist-dev-api
# terraform import module.vpc.google_compute_firewall.default_allow_internal projects/finpist-dev/global/firewalls/default-allow-internal
# terraform import module.vpc.google_compute_firewall.default_allow_ssh projects/finpist-dev/global/firewalls/default-allow-ssh
# terraform import module.vpc.google_compute_firewall.default_allow_rdp projects/finpist-dev/global/firewalls/default-allow-rdp
# terraform import module.vpc.google_compute_firewall.default_allow_icmp projects/finpist-dev/global/firewalls/default-allow-icmp
# =============================================================================

# VPC Module
module "vpc" {
  source = "./modules/vpc"

  # Required variables
  project_id = var.project_id
  region     = var.region

  # VPC Configuration
  vpc_name        = var.vpc_name
  vpc_description = var.vpc_description
  vpc_mtu         = var.vpc_mtu
  environment     = var.environment

  # Subnet CIDR Ranges
  subnet_web_cidr  = var.subnet_web_cidr
  subnet_data_cidr = var.subnet_data_cidr
  subnet_api_cidr  = var.subnet_api_cidr
}

