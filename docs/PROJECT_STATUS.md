# Project Status

## Portfolio Scope

A DevSecOps reference implementation for a React-based streaming UI, AWS-oriented Terraform, Jenkins automation, container scanning, and Kubernetes deployment manifests.

## Intended Deployment Path

Use the existing `Terraform/`, `Jenkins/`, `Kubernetes/`, and `Application-Code/` directories. The project does not use generic EKS or sample-app templates.

## Safety and Validation

This repository contains **non-production reference configuration** unless its deployment guide explicitly states otherwise. Review every Terraform plan and Kubernetes manifest in an isolated account, project, subscription, compartment, or cluster before use. Do not commit credentials, cloud access keys, API tokens, or live state files.

## What to Discuss in an Interview

Explain the architecture, the operational trade-offs, how you would validate a change, how you would roll it back, and the parts that require organisation-specific configuration.
