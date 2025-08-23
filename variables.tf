# =============================================================================
# VARIABLES
# =============================================================================

variable "project_id" {
  description = "The ID of the project to deploy resources to"
  type        = string
  default     = "finpist-dev"
}

variable "region" {
  description = "The region to deploy resources to"
  type        = string
  default     = "asia-south1"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "finpist-dev-vpc"
}

variable "vpc_description" {
  description = "Description of the VPC"
  type        = string
  default     = "VPC for development environment"
}

variable "vpc_mtu" {
  description = "Maximum Transmission Unit for the VPC"
  type        = number
  default     = 1460
}

variable "environment" {
  description = "Environment name (e.g., development, staging, production)"
  type        = string
  default     = "development"
}

variable "subnet_web_cidr" {
  description = "CIDR range for web subnet"
  type        = string
  default     = "10.10.0.0/24"
}

variable "subnet_data_cidr" {
  description = "CIDR range for data subnet"
  type        = string
  default     = "10.10.1.0/24"
}

variable "subnet_api_cidr" {
  description = "CIDR range for API subnet"
  type        = string
  default     = "10.10.2.0/24"
}
