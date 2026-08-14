SHELL := /usr/bin/env bash

.PHONY: validate app-check terraform-check manifests-check security-check

validate: app-check terraform-check manifests-check

app-check:
	cd Application-Code && corepack enable && yarn install --frozen-lockfile && yarn build

terraform-check:
	cd Terraform && terraform fmt -check -recursive && terraform init -backend=false && terraform validate

manifests-check:
	kubectl apply --dry-run=client -f Kubernetes/

security-check:
	trivy fs --scanners vuln,secret --severity HIGH,CRITICAL --exit-code 1 --no-progress Application-Code
