# Incident Note Template: Request Fails After Rollout

Use this during a controlled test or a real issue. The goal is to capture the sequence of checks, not to make the incident sound dramatic.

## Summary

| Item | Record |
|---|---|
| Start time | |
| Deployment revision | |
| User-facing symptom | |
| Scope | |
| Rollback needed? | |

## Checks in order

1. `kubectl rollout status deployment/netflix-app`
2. `kubectl get endpoints netflix-app`
3. `./scripts/smoke-test.sh`
4. `kubectl logs deployment/netflix-app --tail=100`
5. Inspect ingress or load-balancer health only if the in-cluster request succeeds.

## Finding and decision

Write the observed fact, then the action. For example: “The Service had no endpoints because the new pod was failing readiness. I rolled back instead of changing ingress settings.”

## Follow-up

| Owner | Change | Due date | Verified? |
|---|---|---|---|
| | | | |
