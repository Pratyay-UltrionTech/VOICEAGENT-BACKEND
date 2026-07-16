#!/bin/bash
# Azure Oryx sets PYTHONPATH to the extracted antenv under /tmp.
# Do not spawn a nested shell or cd away — use `python` from the Oryx wrapper.
PORT="${PORT:-${WEBSITES_PORT:-8000}}"
exec python -m uvicorn app.main:app --host 0.0.0.0 --port "$PORT"
