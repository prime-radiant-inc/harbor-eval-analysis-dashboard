# harbor-eval-analysis-dashboard

Internal tool for visualizing running [Harbor](https://github.com/lm-pub/harbor) evals. Browse runs, inspect per-task results, view agent trajectories, and compare runs side-by-side.

## Quick start

```bash
pip install -r requirements.txt
python server.py --data-dir /path/to/runs --port 8080
```

The dashboard reads Harbor's output directory structure directly from disk. Point `--data-dir` at the directory containing your job folders.

## Expected data layout

```
runs/
  job-name/
    manifest.json
    config.json
    result.json
    task-name__hash/
      verifier/reward.txt
      verifier/test-stdout.txt
      agent/agent-state/sessions/*.transcript.jsonl
      agent/agent-state/api.jsonl
      agent/command-0/stdout.txt
      agent/command-0/command.txt
      agent/artifacts/
      result.json
```

## Configuration

| Environment variable | Default | Description |
|---|---|---|
| `DASHBOARD_DATA_DIR` | `/data/evals/runs` | Root directory containing eval run data |
| `DASHBOARD_PORT` | `8080` | Server port (when using `python server.py`) |

## API

Every endpoint returns markdown by default. Send `Accept: application/json` for JSON.

- `GET /api/runs` - List all runs
- `GET /api/runs/{job}` - Run summary
- `GET /api/runs/{job}/tasks` - Task list with stats
- `GET /api/runs/{job}/tasks/{task}` - Task detail with trajectory
- `GET /api/runs/{job}/tasks/{task}/artifacts` - Artifact file list
- `GET /api/compare?a={job_a}&b={job_b}` - Compare two runs
- `GET /api/tasks/{task}/history` - Task results across runs
- `GET /raw/{path}` - Raw file viewer
- `GET /health` - Health check

## Tests

```bash
pip install pytest httpx
pytest
```

## License

Apache 2.0
