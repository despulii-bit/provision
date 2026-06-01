variable "proxmox_api_token" {
  type      = string
  sensitive = true
  description = "The API Token used to authenticate with Proxmox VE"
}