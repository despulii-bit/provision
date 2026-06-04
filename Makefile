# Define the core podman execution wrapper for OpenTofu
TOFU_RUN = podman run --rm -it -v $(CURDIR)/opentofu:/workspace -w /workspace ghcr.io/opentofu/opentofu:latest

# Define the core podman execution wrapper for Ansible
# We mount your local ~/.ssh folder so the container has access to your keys and config
ANSIBLE_RUN = podman run --rm -it \
	-v $(CURDIR)/ansible:/workspace \
	-v $(HOME)/.ssh:/root/.ssh:ro \
	-w /workspace \
	docker.io/cytopia/ansible:latest-tools

init:
	$(TOFU_RUN) init

plan:
	$(TOFU_RUN) plan -var-file="secret.tfvars"

apply:
	$(TOFU_RUN) apply -var-file="secret.tfvars"

destroy:
	$(TOFU_RUN) destroy -var-file="secret.tfvars"

# --- Ansible Automation Targets ---

# Run an ad-hoc ping to test the connection to your Proxmox node
ansible-ping:
	$(ANSIBLE_RUN) ansible proxmox_nodes -i inventory.ini -m ping

# Run your core system configuration playbook
ansible-apply:
	$(ANSIBLE_RUN) ansible-playbook -i inventory.ini playbooks/system_setup.yml
