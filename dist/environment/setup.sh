#!/bin/bash
set -Ceo pipefail

# This script was manually placed.
# This script is a helper to setup the Ansible environment on your Cloud9

CWD="${HOME}/environment"
cd "${CWD}" || exit 1 # enforce correct working directory

REPO_DIR="${CWD}/github/aws-cloud9-provisioning"

mkdir -p "${CWD}/.secrets/"
mkdir -p "${CWD}/github/"
git clone "https://github.com/mvrahden/aws-cloud9-provisioning.git" --branch "main" "${REPO_DIR}" \
   || bash -c "cd \"${REPO_DIR}/\" && git pull --ff-only"

cp -n "${REPO_DIR}/ansible_secrets_example.yml" "${CWD}/.secrets/.ansible_secrets_example.yml"

SECRETS_FILE="${HOME}/environment/.secrets/.ansible_secrets.yml"
{ true > "${SECRETS_FILE}"; } &> /dev/null || (echo "")

ANSIBLE_VARS_FILE="${REPO_DIR}/host_vars/local.yml"
{ true > "${ANSIBLE_VARS_FILE}"; } &> /dev/null || (echo "")

cat >&2 <<-xEOF
    ------------
    Your ansible is all setup!
    Now please setup your secrets file in "${SECRETS_FILE}"
    and your variables in "${ANSIBLE_VARS_FILE}"
xEOF
