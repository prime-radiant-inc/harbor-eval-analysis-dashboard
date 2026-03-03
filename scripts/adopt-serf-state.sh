#!/usr/bin/env bash
# Creates agent-state -> serf-state symlinks for Harbor compatibility.
#
# Harbor writes transcript data to agent/serf-state/ but the dashboard
# code expects agent/agent-state/. This script bridges the gap with
# relative symlinks. Re-runnable — skips directories that already have
# an agent-state link or directory.
#
# Usage: ./scripts/adopt-serf-state.sh /data/serf-evals/runs

set -euo pipefail

data_dir="${1:?Usage: $0 <data-dir>}"

find "$data_dir" -type d -name serf-state -path "*/agent/serf-state" | while read -r sd; do
  link="${sd%serf-state}agent-state"
  [ -e "$link" ] && continue
  ln -s serf-state "$link"
  echo "linked: $link -> serf-state"
done
