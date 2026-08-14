# Deployment Demo Record

Use this page after a test-cluster run. Keep it short and replace the blanks with the real result. Do not add a claim if you did not run the command.

## Run details

| Item | Record |
|---|---|
| Date and environment | |
| Cluster/context used | |
| Image reference deployed | |
| Manifest revision | |
| Operator | |

## Commands run

```bash
./scripts/validate.sh
kubectl apply -f Kubernetes/
./scripts/smoke-test.sh
```

## Result

| Check | Result | Link or screenshot location |
|---|---|---|
| Application build | |
| Terraform validation | |
| Manifest validation | |
| Image/filesystem scan | |
| Rollout status | |
| In-cluster HTTP smoke test | |

## One observation

Write one useful detail from the run. Examples: an image pull delay, a readiness mismatch, a missing endpoint, or a command that needed adjustment.

## Next change

Record one small improvement and why it is worth making. Leave this blank if the run did not justify a change.
