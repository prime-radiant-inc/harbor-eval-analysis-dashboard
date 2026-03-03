#!/usr/bin/env bash
# Pull latest code and restart the dashboard.
# Usage: ./scripts/update.sh

set -euo pipefail

cd /opt/harbor-eval-analysis-dashboard

git pull --ff-only
.venv/bin/pip install -q -r requirements.txt

# Adopt any new serf-state dirs from recent eval runs
./scripts/adopt-serf-state.sh /data/serf-evals/runs

sudo systemctl restart dashboard
echo "Dashboard updated and restarted."
