variable "virtual_environment_endpoint" {
  type        = string
  description = "The endpoint for the Proxmox Virtual Environment API (example: https://host:port)"
}

variable "virtual_environment_token" {
  type        = string
  description = "The token for the Proxmox Virtual Environment API"
}

variable "virtual_environment_password" {
  type        = string
  description = "The root password for the Proxmox Host"
  sensitive   = true
}

variable "opentofu_ssh_key" {
  type        = string
  description = "Dedicated public SSH key for OpenTofu-deployed VMs"
}
