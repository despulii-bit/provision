resource "proxmox_virtual_environment_vm" "test_server" {
  name        = "declarative-test-01"
  description = "Managed entirely via OpenTofu from laptop"
  tags        = ["tofu", "testing"]
  node_name   = "pve" # <--- Change this to match your Proxmox node name

  # Core hardware allocations
  cpu {
    cores = 2
    type  = "x86-64-v2-AES" # Standard safe default for modern CPUs
  }

  memory {
    dedicated = 2048
  }

  # Network mapping
  network_device {
    bridge = "vmbr0"
  }

  # Operating System layout
  operating_system {
    type = "l26" # Linux kernel 2.6+ (Modern Linux)
  }

  # Initialization disk configuration
  initialization {
    datastore_id = "nvme-mirror"
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }
}
