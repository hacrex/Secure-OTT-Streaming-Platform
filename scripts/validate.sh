#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

require() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "Required command not found: $1" >&2
    exit 127
  }
}

require node
require corepack
require terraform
require kubectl

printf '\n==> Building the application\n'
(
  cd Application-Code
  corepack enable
  yarn install --frozen-lockfile
  yarn build
)

printf '\n==> Validating Terraform without a remote backend\n'
(
  cd Terraform
  terraform fmt -check -recursive
  terraform init -backend=false
  terraform validate
)

printf '\n==> Rendering Kubernetes resources locally\n'
kubectl apply --dry-run=client -f Kubernetes/

if command -v trivy >/dev/null 2>&1; then
  printf '\n==> Scanning application files with Trivy\n'
  trivy fs --scanners vuln,secret --severity HIGH,CRITICAL --exit-code 1 --no-progress Application-Code
else
  printf '\n==> Trivy is not installed; skipping the optional filesystem scan.\n'
fi

printf '\nValidation completed successfully.\n'
