terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.108.0"
    }
  }
}

provider "proxmox" {
  endpoint = var.virtual_environment_endpoint
  insecure = true

  username = "root@pam"
  password = var.virtual_environment_password

  ssh {
    agent    = true
    username = "root"
  }
}
