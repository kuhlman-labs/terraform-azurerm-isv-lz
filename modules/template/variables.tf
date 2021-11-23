###
# module inputs
###

#common

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

variable "location" {
  description = "Geographic region resource will be deployed into"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(any)
  default     = {}
}

variable "name_prefix" {
  description = "A short pre-defined text to identify the resource type"
  type        = string
}
