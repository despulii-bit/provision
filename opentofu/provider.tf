terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.60.0"
    }
  }
}

provider "proxmox" {
   endpoint = "https://192.168.1.110:8006/"

  # This points to a secure variable we will define next
  api_token = var.proxmox_api_token

  # Set to true if your Proxmox SSL certificate is self-signed
  insecure  = true
}
