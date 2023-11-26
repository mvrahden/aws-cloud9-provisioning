# cloud9-dev

Ansible playbook for Cloud9 development environment

Sets up a new environment within a AWS Cloud9 EC2 instance running Amazon Linux
AMI.

## Setup

```bash
# Copy the scripts (`dist/environment`) into your `~/environment` directory and execute them.
cp -n dist/environment/resize.sh ~/environment/resize.sh
cp -n dist/environment/setup.sh ~/environment/setup.sh

# Install Ansible Galaxy dependencies
make init

# Run Ansible playbook
make run
```
