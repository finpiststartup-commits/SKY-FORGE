# VPC Module

This module creates a complete VPC infrastructure including the VPC network, subnets, and firewall rules.

## Module Structure

```
modules/vpc/
├── main.tf       # Module entry point and documentation
├── vpc.tf        # VPC network resource
├── subnets.tf    # Subnet resources
├── firewall.tf   # Firewall rules
├── variables.tf  # Input variables
├── outputs.tf    # Output values
└── README.md     # This documentation
```

## Features

- **VPC Network**: Custom VPC with manual subnet creation
- **Subnets**: Three subnets for different tiers (web, data, API)
- **Firewall Rules**: Default firewall rules for internal, SSH, RDP, and ICMP traffic

## Usage

```hcl
module "vpc" {
  source = "./modules/vpc"

  # Required variables
  project_id = "your-project-id"
  region     = "asia-south1"

  # VPC Configuration
  vpc_name        = "my-vpc"
  vpc_description = "VPC for my application"
  vpc_mtu         = 1460
  environment     = "development"

  # Subnet CIDR Ranges
  subnet_web_cidr  = "10.10.0.0/24"
  subnet_data_cidr = "10.10.1.0/24"
  subnet_api_cidr  = "10.10.2.0/24"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project_id | The ID of the project to deploy resources to | `string` | n/a | yes |
| region | The region to deploy resources to | `string` | n/a | yes |
| vpc_name | Name of the VPC | `string` | `"finpist-dev-vpc"` | no |
| vpc_description | Description of the VPC | `string` | `"VPC for development environment"` | no |
| vpc_mtu | Maximum Transmission Unit for the VPC | `number` | `1460` | no |
| environment | Environment name | `string` | `"development"` | no |
| subnet_web_cidr | CIDR range for web subnet | `string` | `"10.10.0.0/24"` | no |
| subnet_data_cidr | CIDR range for data subnet | `string` | `"10.10.1.0/24"` | no |
| subnet_api_cidr | CIDR range for API subnet | `string` | `"10.10.2.0/24"` | no |

## Outputs

| Name | Description |
|------|-------------|
| vpc_id | The ID of the VPC |
| vpc_name | The name of the VPC |
| vpc_self_link | The self-link of the VPC |
| vpc_gateway_ipv4 | The gateway IPv4 address of the VPC |
| subnet_web_id | The ID of the web subnet |
| subnet_web_name | The name of the web subnet |
| subnet_web_cidr | The CIDR range of the web subnet |
| subnet_data_id | The ID of the data subnet |
| subnet_data_name | The name of the data subnet |
| subnet_data_cidr | The CIDR range of the data subnet |
| subnet_api_id | The ID of the API subnet |
| subnet_api_name | The name of the API subnet |
| subnet_api_cidr | The CIDR range of the API subnet |
| firewall_rules | List of firewall rule names |
| firewall_rule_ids | Map of firewall rule names to IDs |
| network_summary | Summary of the network infrastructure |

## Resources Created

- 1 VPC network
- 3 subnets (web, data, API)
- 4 firewall rules (internal, SSH, RDP, ICMP)

## Firewall Rules

1. **Internal Traffic**: Allows all TCP/UDP/ICMP traffic within the VPC (10.0.0.0/8)
2. **SSH Access**: Allows SSH (port 22) from anywhere
3. **RDP Access**: Allows RDP (port 3389) from anywhere
4. **ICMP**: Allows ping from anywhere

## Example Output

```hcl
network_summary = {
  vpc_name = "finpist-dev-vpc"
  vpc_id   = "projects/finpist-dev/global/networks/finpist-dev-vpc"
  subnets = {
    web  = "finpist-dev-web"
    data = "finpist-dev-data"
    api  = "finpist-dev-api"
  }
  firewall_rules_count = 4
  region               = "asia-south1"
  project_id           = "finpist-dev"
}
```
