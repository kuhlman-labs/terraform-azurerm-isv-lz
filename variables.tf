###
# environment inputs
###
#common

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(any)
  default     = {}
}