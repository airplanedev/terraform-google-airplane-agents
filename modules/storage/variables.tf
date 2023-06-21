variable "region" {
  type        = list(string)
  description = "List of subnet IDs for ECS service. All subnets must be from the same VPC."
  default     = []
}
