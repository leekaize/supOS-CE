## 🔧 supOS-bedrock: Open Foundation for Industrial Platforms

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Status](https://img.shields.io/badge/status-development-yellow.svg)]()

> [!important]
> **This is a platform reimagining of [supOS-CE](https://github.com/FREEZONEX/supOS-CE).**
> Think Nextcloud AIO for industrial systems—install the core, choose your apps.

**What's Different:**
- ✅ **Setup wizard** → Zero manual config. Admin created via UI.
- ✅ **Modular apps** → Install Grafana, MinIO, ELK post-deployment
- ✅ **Integrated app store** → Add capabilities without reinstall
- ✅ **One-click updates** → Version management from UI
- ✅ **Automated backups** → Database exports + config snapshots

**Philosophy:** Nextcloud did it for file sharing. We're doing it for industrial data.

**Status:** Hackathon prototype (7-day sprint)  
**Docs:** [Sprint Plan](./docs/HACKATHON-SPRINT.md) | [Architecture Decisions](./docs/ADR.md)

## One-Command Install

### Quick Start
```bash
docker run -d \
  --name supos-bedrock \
  --restart always \
  -p 8080:8080 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /volumes/supos/data:/volumes/supos/data \
  -e ENTRANCE_DOMAIN=YOUR_SERVER_IP \
  -e ENTRANCE_PORT=8088 \
  leekaize/supos-bedrock:latest
```

Then open: http://YOUR_SERVER_IP:8080

### Requirements
- Docker 20.10+
- 4GB RAM minimum
- Ports 8080 and 8088 available

### Features

- [x] GUI for first-run setup and installation
- [x] Single Docker command to run on both amd64 & arm64
- [ ] Use Docker volume instead of hard-coded system path
- [ ] Modify Keycloak master realm account alongside with supOS account
