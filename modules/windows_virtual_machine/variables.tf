###
# module inputs
###

#common

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services, poc"
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
  description = "A short pre-defined text to identify the workload"
  type        = string
}

variable "subnet_id" {
  description = "subnet id for virtual machine"
  type        = string
}

variable "enable_zone" {
  description = "(Optional) Enable zone deployment for this Virtual Machine."
  type        = bool
  default     = false
}

variable "zones" {
  description = "(Optional) The Zone in which this Virtual Machine should be created. Changing this forces a new resource to be created."
  type        = list(number)
  default     = []
}

variable "admin_password" {
  description = "(Required) The Password which should be used for the local-administrator on this Virtual Machine. Changing this forces a new resource to be created."
  type        = string
}

variable "admin_username" {
  description = "(Required) The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created."
  type        = string
}

variable "vm_count" {
  description = "(Optional) number of VMs to create"
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "(Required) The SKU which should be used for this Virtual Machine, such as Standard_F2."
  type        = string
}
