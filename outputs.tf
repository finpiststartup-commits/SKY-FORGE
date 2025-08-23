# =============================================================================
# OUTPUTS
# =============================================================================

# VPC Outputs
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_name" {
  description = "The name of the VPC"
  value       = module.vpc.vpc_name
}

output "vpc_self_link" {
  description = "The self-link of the VPC"
  value       = module.vpc.vpc_self_link
}

output "vpc_gateway_ipv4" {
  description = "The gateway IPv4 address of the VPC"
  value       = module.vpc.vpc_gateway_ipv4
}

# Subnet Outputs
output "subnet_web_id" {
  description = "The ID of the web subnet"
  value       = module.vpc.subnet_web_id
}

output "subnet_web_name" {
  description = "The name of the web subnet"
  value       = module.vpc.subnet_web_name
}

output "subnet_web_cidr" {
  description = "The CIDR range of the web subnet"
  value       = module.vpc.subnet_web_cidr
}

output "subnet_data_id" {
  description = "The ID of the data subnet"
  value       = module.vpc.subnet_data_id
}

output "subnet_data_name" {
  description = "The name of the data subnet"
  value       = module.vpc.subnet_data_name
}

output "subnet_data_cidr" {
  description = "The CIDR range of the data subnet"
  value       = module.vpc.subnet_data_cidr
}

output "subnet_api_id" {
  description = "The ID of the API subnet"
  value       = module.vpc.subnet_api_id
}

output "subnet_api_name" {
  description = "The name of the API subnet"
  value       = module.vpc.subnet_api_name
}

output "subnet_api_cidr" {
  description = "The CIDR range of the API subnet"
  value       = module.vpc.subnet_api_cidr
}

# Firewall Outputs
output "firewall_rules" {
  description = "List of firewall rule names"
  value       = module.vpc.firewall_rules
}

output "firewall_rule_ids" {
  description = "Map of firewall rule names to IDs"
  value       = module.vpc.firewall_rule_ids
}

# Summary Outputs
output "network_summary" {
  description = "Summary of the network infrastructure"
  value       = module.vpc.network_summary
}
