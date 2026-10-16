#!/usr/bin/env sh
set -eu

if [ -f student.env ]; then
  set -a
  # shellcheck disable=SC1091
  . ./student.env
  set +a
fi

APP_PORT="${APP_PORT:-8092}"

echo "=== Tai khoan va nhom ==="
whoami
id

echo "=== Docker Compose ==="
docker compose version
docker compose --env-file student.env ps

echo "=== API De 007 ==="
curl -fsS "http://localhost:${APP_PORT}/api/tickets"
echo
