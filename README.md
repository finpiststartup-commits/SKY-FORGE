# SkyForge - Terraform Infrastructure

### Sky Forge – Sculpting the Cloud, Empowering Infrastructure

Sky Forge is a powerful Terraform project designed to seamlessly build and manage cloud infrastructure with precision and efficiency. It empowers teams to sculpt scalable, reliable, and secure environments in the cloud, combining automation with best practices to deliver robust infrastructure-as-code solutions. Whether deploying networks, compute resources, or storage, Sky Forge provides a solid foundation for modern cloud-native applications, enabling rapid innovation and operational excellence.

This repository contains a modular Terraform configuration for managing Google Cloud Platform infrastructure.

## 📁 Project Structure

```
SkyForge/
├── main.tf              # Main entry point with module calls
├── versions.tf          # Terraform and provider version constraints
├── providers.tf         # Provider configuration
├── variables.tf         # Variable definitions
├── outputs.tf          # Output values
├── terraform.tfvars    # Environment-specific variable values
├── .gitignore          # Git ignore file
├── README.md           # This file
└── modules/            # Terraform modules
    └── vpc/            # VPC module
        ├── main.tf     # Module entry point
        ├── vpc.tf      # VPC network resource
        ├── subnets.tf  # Subnet resources
        ├── firewall.tf # Firewall rules
        ├── variables.tf# Module variables
        ├── outputs.tf  # Module outputs
        └── README.md   # Module documentation
```

## 🏗️ Infrastructure Components

### Network Infrastructure
- **VPC**: Custom VPC with manual subnet creation
- **Subnets**: Three subnets for different purposes:
  - `finpist-dev-web` (10.10.0.0/24) - Web tier
  - `finpist-dev-data` (10.10.1.0/24) - Data tier
  - `finpist-dev-api` (10.10.2.0/24) - API tier

### Security
- **Firewall Rules**: Four default firewall rules:
  - Internal traffic (TCP/UDP/ICMP)
  - SSH access (port 22)
  - RDP access (port 3389)
  - ICMP (ping)

### Monitoring
- **Flow Logs**: Enabled on all subnets for network monitoring

## 🚀 Getting Started

### Prerequisites
- Terraform >= 1.0
- Google Cloud SDK
- Appropriate GCP permissions

### Authentication
This configuration uses Google Secret Manager for service account credentials:
1. Ensure you have access to the secret `finpist-terraform-dev-sa-key`
2. The service account should have the necessary permissions

### Initial Setup
```bash
# Initialize Terraform
terraform init

# Plan the deployment
terraform plan

# Apply the configuration
terraform apply
```

## 📋 Importing Existing Resources

If you have existing resources that need to be imported:

```bash
# Import VPC
terraform import google_compute_network.vpc projects/finpist-dev/global/networks/finpist-dev-vpc

# Import Subnets
terraform import google_compute_subnetwork.subnet_web projects/finpist-dev/regions/asia-south1/subnetworks/finpist-dev-web
terraform import google_compute_subnetwork.subnet_data projects/finpist-dev/regions/asia-south1/subnetworks/finpist-dev-data
terraform import google_compute_subnetwork.subnet_api projects/finpist-dev/regions/asia-south1/subnetworks/finpist-dev-api

# Import Firewall Rules
terraform import google_compute_firewall.default_allow_internal projects/finpist-dev/global/firewalls/default-allow-internal
terraform import google_compute_firewall.default_allow_ssh projects/finpist-dev/global/firewalls/default-allow-ssh
terraform import google_compute_firewall.default_allow_rdp projects/finpist-dev/global/firewalls/default-allow-rdp
terraform import google_compute_firewall.default_allow_icmp projects/finpist-dev/global/firewalls/default-allow-icmp
```

## 🔧 Configuration

### Variables
All configurable values are defined in `variables.tf` with defaults. Override them in `terraform.tfvars`:

```hcl
project_id = "your-project-id"
region     = "your-region"
environment = "development"
```

### Environment-Specific Values
Create environment-specific `.tfvars` files:
- `terraform.tfvars` (default)
- `terraform.dev.tfvars`
- `terraform.prod.tfvars`

Apply with: `terraform apply -var-file="terraform.prod.tfvars"`

## 📊 Outputs

The configuration provides comprehensive outputs:

```bash
# View all outputs
terraform output

# View specific outputs
terraform output vpc_id
terraform output network_summary
```

## 🔒 Security Considerations

- Firewall rules are configured for development environment
- Consider restricting SSH/RDP access to specific IP ranges for production
- Review and adjust firewall rules based on your security requirements
- Enable VPC flow logs for network monitoring and security analysis

## 🧹 Cleanup

To destroy all resources:
```bash
terraform destroy
```

⚠️ **Warning**: This will permanently delete all managed resources!

## 📝 Best Practices

1. **Version Control**: Always commit your Terraform files to version control
2. **State Management**: Use remote state storage (GCS, S3, etc.) for team collaboration
3. **Variables**: Use variables for all configurable values
4. **Documentation**: Keep this README updated with any changes
5. **Testing**: Test changes in a development environment first
6. **Backup**: Regularly backup your Terraform state

## 🤝 Contributing

1. Create a feature branch
2. Make your changes
3. Test with `terraform plan`
4. Update documentation
5. Submit a pull request

## 📞 Support

For issues or questions:
1. Check the Terraform documentation
2. Review Google Cloud documentation
3. Create an issue in this repository

---

**Note**: This configuration is designed for development environments. Review and adjust security settings for production use.
