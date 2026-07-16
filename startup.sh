#!/bin/bash
set -euo pipefail

cd /home/site/wwwroot
export PYTHONPATH="/home/site/wwwroot:${PYTHONPATH:-}"
PORT="${PORT:-8000}"

if [ -x "./antenv/bin/python" ]; then
  exec ./antenv/bin/python -m uvicorn app.main:app --host 0.0.0.0 --port "$PORT"
fi

exec python -m uvicorn app.main:app --host 0.0.0.0 --port "$PORT"
