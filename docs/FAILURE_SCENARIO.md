# Failure Scenario: Healthy Pods, Failing Requests

## Situation

A release completes and the deployment reports ready replicas, but customers receive HTTP 502 responses through the edge or ingress path.

## First Response

1. Pause promotion and record the image tag and deployment revision.
2. Confirm the impact scope: route, region, error ratio, and start time.
3. Check the Service endpoints. No endpoints usually indicates a selector mismatch or failed readiness.
4. Request the Service from inside the cluster using `./scripts/smoke-test.sh`.
5. If the in-cluster request works, inspect Ingress/load-balancer configuration and target health. If it fails, inspect the new pod logs, port mapping, environment, and application start-up errors.
6. Roll back to the previous known-good Deployment revision if user impact continues and the fix is not immediately low risk.

## Prevention

Keep the local manifest validation, in-cluster smoke test, and immutable image tag in the release path. Add an ingress-level synthetic check only after an ingress hostname and test environment exist.
