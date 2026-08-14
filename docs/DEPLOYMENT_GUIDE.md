# Deployment Guide

## Deployment Sequence

1. Review `Terraform/` and create environment-specific variables outside version control. Confirm the remote-state backend and IAM roles before running Terraform.
2. Build and scan the application image from `Application-Code/`.
3. Run the Jenkins pipeline from `Jenkins/Jenkinsfile` only after configuring CI credentials through the platform secret store.
4. Deploy the reviewed manifests in `Kubernetes/` to a non-production cluster and validate pod readiness, service endpoints, and application health before promotion.

## Validation Checklist

```bash
cd Terraform
terraform fmt -check -recursive
terraform init
terraform validate
terraform plan

kubectl apply --dry-run=server -f ../Kubernetes/
kubectl get deploy,svc,pods
```

## Rollback

Use the deployment system's recorded revision or revert the GitOps manifest commit. Do not use a broad cluster deletion as a rollback mechanism.
