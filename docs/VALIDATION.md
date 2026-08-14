# Validation Guide

Run validation before creating a release or attempting a deployment.

```bash
./scripts/validate.sh
```

The script builds the application, runs Terraform formatting and validation without contacting the configured remote backend, validates Kubernetes YAML locally, and runs a Trivy filesystem scan when Trivy is installed.

| Check | Command | What it proves |
|---|---|---|
| Application | `corepack enable && yarn install --frozen-lockfile && yarn build` | The frontend TypeScript/Vite build completes from the committed Yarn lockfile. |
| Terraform | `terraform init -backend=false && terraform validate` | Terraform syntax and module wiring are valid without changing remote state. |
| Kubernetes | `kubectl apply --dry-run=client -f Kubernetes/` | The client can parse the manifest bundle. |
| Security | `trivy fs ... Application-Code` | A high/critical vulnerability and secret scan is performed against the application tree. |

Use `./scripts/smoke-test.sh` only against a cluster where the reviewed deployment has already been applied. It waits for the rollout, verifies ready service endpoints, and performs an in-cluster HTTP request. It does not test public ingress, CDN, authentication, or third-party API behaviour.
