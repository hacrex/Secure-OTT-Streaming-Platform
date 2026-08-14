# Portfolio Notes

## My focus

I use this project to explain how a delivery pipeline should fail safely: image scanning before promotion, declarative runtime configuration, and a rollback decision based on user impact rather than only pipeline status.

## Evidence I can show

- `Application-Code/Dockerfile` for image packaging.
- `Jenkins/Jenkinsfile` for pipeline stages.
- `Terraform/` and `Kubernetes/` for infrastructure and runtime configuration.
- `docs/DEPLOYMENT_GUIDE.md` for a plan-first validation sequence.

## Known boundary

The repository is an upstream-based reference implementation. I would not describe it as a live production streaming platform unless I have run it in my own cloud environment and can show the deployment evidence.
