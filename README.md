# Secure OTT Streaming Platform

A small DevSecOps reference for taking a web application from source to a Kubernetes deployment. The repository keeps the application, container build, Terraform, manifests, and a Jenkins pipeline close together so the delivery path is easy to inspect.

The frontend source originated from [AmanPathak-DevOps/Netflix-Clone-K8S-End-to-End-Project](https://github.com/AmanPathak-DevOps/Netflix-Clone-K8S-End-to-End-Project). The upstream license and attribution are retained in this repository.

## Layout

| Path | Purpose |
|---|---|
| `Application-Code/` | Web application source. |
| `Terraform/` | AWS infrastructure configuration. |
| `Kubernetes/` | Deployment and Service manifests. |
| `Jenkins/Jenkinsfile` | Build, scan, publish, deploy, and smoke-test pipeline. |
| `scripts/` | Local checks and an in-cluster smoke test. |

## Before deploying

```bash
./scripts/validate.sh
```

The validation script builds the app from the committed Yarn lockfile, checks Terraform without a remote backend, renders the Kubernetes resources locally, and runs Trivy when it is installed.

After applying the reviewed manifests to a test cluster, use:

```bash
./scripts/smoke-test.sh
```

The Jenkins pipeline publishes an immutable image tag and updates the running deployment to that tag. Cloud credentials, registry credentials, and cluster access are intentionally not stored in the repository.

## Notes

This is a reference deployment path, not a hosted streaming service. It does not include CDN configuration, a real authentication flow, media licensing, or production secrets management.
