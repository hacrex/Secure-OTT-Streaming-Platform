# Secure OTT Streaming Platform

A portfolio adaptation of [Aman Pathak’s Netflix Clone K8s End-to-End Project](https://github.com/AmanPathak-DevOps/Netflix-Clone-K8S-End-to-End-Project), retained under the upstream MIT License. I use this repository to study and explain an end-to-end DevSecOps delivery path for a React streaming interface.

## What this repository demonstrates

- A React/Vite application packaged with Docker in `Application-Code/`.
- Jenkins pipeline configuration in `Jenkins/Jenkinsfile`.
- AWS-oriented Terraform in `Terraform/`.
- Kubernetes deployment and service manifests in `Kubernetes/`.
- A security-oriented delivery discussion: image scanning, reviewed changes, runtime validation, and rollback.

## What I changed for this portfolio

I removed unrelated generic EKS and `sample-app` templates, restored upstream attribution, and added a deployment guide and project-status notes that separate the reference implementation from production claims.

## Use it responsibly

This is a reference project, not a claim that a full Netflix-like production service is running from this repository. Before applying anything, use a disposable AWS account and Kubernetes cluster, review the Terraform plan, configure CI secrets outside Git, and validate the complete ingress-to-service path.

```bash
cd Terraform
terraform fmt -check -recursive
terraform init
terraform validate
terraform plan
```

Read [`docs/DEPLOYMENT_GUIDE.md`](docs/DEPLOYMENT_GUIDE.md) before deployment. The historical upstream README is retained in [`docs/UPSTREAM_README.md`](docs/UPSTREAM_README.md).
