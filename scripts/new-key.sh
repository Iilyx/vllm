#!/bin/sh
# Выдать клиентский ключ. Пример: ./scripts/new-key.sh 30d team-a
set -eu
cd "$(dirname "$0")/.."
set -a
. ./.env
set +a

DURATION="${1:-30d}"
ALIAS="${2:-client}"

curl -sS -X POST "http://127.0.0.1:4000/key/generate" \
  -H "Authorization: Bearer ${LITELLM_MASTER_KEY}" \
  -H "Content-Type: application/json" \
  -d "{\"duration\":\"${DURATION}\",\"key_alias\":\"${ALIAS}\",\"models\":[\"qwen3.5-4b\"]}"
echo
