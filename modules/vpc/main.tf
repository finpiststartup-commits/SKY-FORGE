# =============================================================================
# VPC MODULE - MAIN CONFIGURATION
# =============================================================================
# 
# This is the main entry point for the VPC module.
# The actual resources are defined in separate files:
# - vpc.tf: VPC network resource
# - subnets.tf: Subnet resources
# - firewall.tf: Firewall rules
# - variables.tf: Variable definitions
# - outputs.tf: Output values
#
# This file can be used for data sources or other module-level
# configurations that don't fit in specific resource files.
# =============================================================================
