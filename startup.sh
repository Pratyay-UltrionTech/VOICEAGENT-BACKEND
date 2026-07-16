#!/bin/bash
cd /home/site/wwwroot || exit 1
export PYTHONPATH="/home/site/wwwroot:${PYTHONPATH:-}"
PORT="${PORT:-8000}"

# Oryx creates this venv during deployment when SCM_DO_BUILD_DURING_DEPLOYMENT=true
if [ -x "/home/site/wwwroot/antenv/bin/python" ]; then
  exec /home/site/wwwroot/antenv/bin/python -m uvicorn app.main:app --host 0.0.0.0 --port "$PORT"
fi

exec python3 -m uvicorn app.main:app --host 0.0.0.0 --port "$PORT"
