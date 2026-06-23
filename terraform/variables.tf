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
