# Define the core podman execution wrapper
TOFU_RUN = podman run --rm -it -v $(CURDIR)/opentofu:/workspace -w /workspace ghcr.io/opentofu/opentofu:latest

init:
	$(TOFU_RUN) init

plan:
	$(TOFU_RUN) plan -var-file="secret.tfvars"

apply:
	$(TOFU_RUN) apply -var-file="secret.tfvars"

destroy:
	$(TOFU_RUN) destroy -var-file="secret.tfvars"
