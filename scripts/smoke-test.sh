#!/usr/bin/env bash
set -euo pipefail

NAMESPACE="${NAMESPACE:-default}"
DEPLOYMENT="${DEPLOYMENT:-netflix-app}"
SERVICE="${SERVICE:-netflix-app}"
PORT="${PORT:-80}"
CURL_IMAGE="${CURL_IMAGE:-curlimages/curl:8.10.1}"
RUN_ID="ott-smoke-$(date +%s)"

command -v kubectl >/dev/null 2>&1 || {
  echo "kubectl is required." >&2
  exit 127
}

printf 'Waiting for deployment/%s in namespace/%s...\n' "$DEPLOYMENT" "$NAMESPACE"
kubectl -n "$NAMESPACE" rollout status "deployment/$DEPLOYMENT" --timeout=180s

printf 'Checking service endpoints...\n'
ENDPOINTS="$(kubectl -n "$NAMESPACE" get endpoints "$SERVICE" -o jsonpath='{.subsets[*].addresses[*].ip}')"
test -n "$ENDPOINTS" || {
  echo "Service $SERVICE has no ready endpoints." >&2
  exit 1
}

printf 'Requesting the service from inside the cluster...\n'
kubectl -n "$NAMESPACE" run "$RUN_ID" --rm -i --restart=Never --image="$CURL_IMAGE" --   curl --fail --show-error --silent --connect-timeout 5 --max-time 15 "http://${SERVICE}:${PORT}/" >/dev/null

printf 'Smoke test passed for service/%s.\n' "$SERVICE"
