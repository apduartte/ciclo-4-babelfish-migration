variable "aws_region" {
  description = "AWS region used for the Babelfish migration POC."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name used for resource naming and tagging."
  type        = string
  default     = "ciclo-4-babelfish-migration"
}

variable "environment" {
  description = "Environment name for this deployment."
  type        = string
  default     = "poc"
}

variable "owner" {
  description = "Owner responsible for the resources."
  type        = string
  default     = "apduartte"
}

variable "vpc_cidr" {
  description = "CIDR block for the Babelfish migration POC VPC."
  type        = string
  default     = "10.40.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDR blocks used by the Aurora/Babelfish POC."
  type        = list(string)
  default     = ["10.40.1.0/24", "10.40.2.0/24"]
}
