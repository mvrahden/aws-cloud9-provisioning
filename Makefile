# ------------------------------------------------------
# VARIABLES
# ------------------------------------------------------
SHELL			:= /bin/bash -o pipefail

# ------------------------------------------------------
# HELP
# ------------------------------------------------------
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# ------------------------------------------------------
# MAIN COMMANDS
# ------------------------------------------------------
.PHONY: all
all: run

.PHONY: assert
assert: ## Assert all requirements are fullfilled
	@test -f "~/environment/.secrets/.ansible_secrets.yml" || echo "Ansible secrets file does not exist" && exit 1
	@test -f "~/environment/github/aws-cloud9-provisioning/host_vars/local.yml" || echo "Ansible host_vars file does not exist" && exit 1

.PHONY: init
init: assert ## Install Ansible Galaxy dependencies
	@ansible-galaxy install -r requirements.yml

.PHONY: run
run: assert ## Runs the ansible tasks
	@ansible-playbook local.yml
