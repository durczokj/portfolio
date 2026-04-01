# Portfolio — durczok.ovh

Personal portfolio website built with [Hugo](https://gohugo.io/) and the [hugo-profile](https://github.com/gurusabarish/hugo-profile) theme.

## Local Development

```bash
hugo server -D
```

Open [http://localhost:1313](http://localhost:1313).

## Configuration

All content is driven from `hugo.yaml` — edit sections, toggle them on/off, or reorder them directly in the config file.

## Docker (local)

```bash
docker compose up --build
```

Serves at [http://localhost:8080](http://localhost:8080).

## Deployment

Pushes to `main` trigger the GitHub Actions pipeline:

1. Builds Hugo site inside a Docker multi-stage build.
2. Pushes `durczokj/portfolio:latest` to DockerHub.
3. SSHs into the VM, pulls the new image, restarts the container on port 80.

### Required GitHub Secrets

| Secret | Purpose |
|---|---|
| `DOCKERHUB_USERNAME` | DockerHub login |
| `DOCKERHUB_TOKEN` | DockerHub access token |
| `SERVER_HOST` | VM IP / hostname |
| `SERVER_USER` | SSH user on VM |
| `SERVER_SSH_KEY` | SSH private key |
