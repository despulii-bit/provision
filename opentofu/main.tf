resource "proxmox_virtual_environment_vm" "test_server" {
  name        = "declarative-nixos-01"
  description = "NixOS instance with custom OpenTofu SSH key"
  node_name   = "pve"

  started = true
  on_boot = true
  bios    = "ovmf"

  clone {
    vm_id = 9000
  }

  agent {
    enabled = true
    timeout = "5m"
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 2048
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  efi_disk {
    datastore_id = "nvme-mirror"
    file_format  = "raw"
    type         = "4m"
  }

  initialization {
    datastore_id = "nvme-mirror"

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    # Dynamic injection of your new dedicated key
    user_account {
      username = "root"
      keys     = [var.opentofu_ssh_key]
    }
  }
}

output "nixos_vm_ip" {
  value = try(proxmox_virtual_environment_vm.test_server.ipv4_addresses[1][0], "Waiting for IP...")
}
