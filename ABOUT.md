# harbor-eval-analysis-dashboard

> Internal Python dashboard for visualizing Harbor eval runs: browse runs, inspect per-task results, view agent trajectories, and compare runs.

**Family:** eval-labs · **Type:** tool · **Lifecycle:** production · **Owner:** obra

## What it does
An internal FastAPI dashboard for visualizing Harbor evals. It reads Harbor's on-disk output directory structure directly and lets you browse runs, inspect per-task results, view agent trajectories, and compare runs side-by-side. Every endpoint returns markdown by default or JSON on request.

## How it fits
- Depends on: — (no internal prime-radiant-inc code/service dependencies; see prose) — Reads the on-disk output format of the external Harbor harness. It consumes result directories that harbor-runner can produce, but does so purely by reading files from a configured directory — no imported code or service call — so there is no dependsOn edge.
- Used by: —
- External: Harbor (external) output format; FastAPI/uvicorn

## Runtime & data
- Runs: Python FastAPI/uvicorn web server
- Data in: Harbor run output directories (manifest/config/result JSON, transcripts, artifacts) read from disk
- Data out: Web UI + markdown/JSON API responses

<!-- Maintained by the maintaining-project-map skill. Do not hand-edit; regenerated. -->
