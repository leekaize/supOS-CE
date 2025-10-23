# supOS-bedrock Path C: Quick Start

**Decision Made:** Hybrid Proxy Architecture

**Core Strategy:** Orchestrator as invisible setup layer. Zero supOS source modifications.

---

## Architecture in 60 Seconds

```
User → Kong (:8088) → [Check flag]
                         ├─ No flag → Orchestrator React Wizard
                         └─ Flag exists → supOS Frontend (native)
```

**After setup:** Kong routes everything to supOS. User never knows orchestrator exists.

---

## Current State

**What exists:**
- Orchestrator (Flask + partial React) at `/orchestrator`
- supOS-CE backend/frontend (untouched)
- Docker Compose with profiles (4c8g, 8c16g)
- Kong gateway configured

**What needs fixing:**
1. Rebuild orchestrator React UI (match supOS theme with Ant Design)
2. Add Keycloak API integration (create admin users)
3. Configure Kong routing (flag-based)
4. Build app store backend (install/uninstall)
5. Add streaming installation logs (SSE)

---

## 7-Day Plan Overview

**Day 1 (3.5h):** Flask API foundation + React wizard scaffold
**Day 2 (3.5h):** Complete wizard UI (5 steps)
**Day 3 (3.5h):** Keycloak integration + Docker control
**Day 4 (3.5h):** Installation streaming + progress UI
**Day 5 (3.5h):** Kong routing + app store API
**Day 6 (3.5h):** Polish + documentation
**Day 7 (3.5h):** Demo video + submission

---

## Key Technical Decisions

### 1. Orchestrator Stack
- **Backend:** Flask (existing)
- **Frontend:** React + Vite + Ant Design 5.x
- **Port:** 8080 (internal), accessed via Kong at 8088

### 2. Setup Flow
1. User visits `:8088` → Kong checks `/config/setup_complete`
2. No flag → Route to orchestrator React wizard
3. Wizard creates Keycloak admin via API
4. Wizard starts Docker Compose with selected profiles
5. Write flag → Kong flips routes to supOS frontend

### 3. App Store
- **Backend:** Orchestrator Flask endpoints
- **Actions:** Install (add profile), Uninstall (stop container)
- **Access:** `/api/apps/*` routed via Kong
- **UI:** Can be standalone or integrated (your choice)

### 4. No supOS Modifications
- **Backend:** Untouched
- **Frontend:** Untouched
- **Keycloak:** Use admin API, not DB direct insert
- **Upgrade-safe:** supOS can be updated independently

---

## Critical Files

**Documents (read these):**
- `ARCHITECTURE-PATH-C.md` - Full technical design
- `HACKATHON-SPRINT-PATH-C.md` - Day-by-day tasks

**Code locations:**
- `orchestrator/app.py` - Flask backend (rebuild this)
- `orchestrator/frontend/` - React wizard (build this)
- `mount/kong/kong.yml` - Kong routes (configure this)
- `docker-compose.yml` - Orchestrator service
- `docker-compose-4c8g.yml` - supOS services + profiles

---

## Day 1 Immediate Actions

### 1. Clean Orchestrator
```bash
cd ~/supOS-bedrock/orchestrator
rm -rf frontend/  # Remove old React app if exists
```

### 2. Create New Flask Backend
Replace `app.py` with Day 1 template from sprint plan.

### 3. Initialize React Frontend
```bash
npm create vite@latest frontend -- --template react-ts
cd frontend
npm install antd @ant-design/icons axios
```

### 4. Test Locally
```bash
# Terminal 1: Flask
python3 app.py

# Terminal 2: React dev server
cd frontend && npm run dev

# Test:
curl http://localhost:8080/api/health
```

### 5. Build & Deploy
```bash
cd frontend && npm run build
# Outputs to: orchestrator/frontend/dist/

# Update Flask static_folder to point to dist/
# Rebuild orchestrator container
docker compose build orchestrator
docker compose up -d orchestrator
```

---

## Key APIs to Build

**Setup Flow:**
```
GET  /api/setup/status          - Check if setup complete
POST /api/setup/validate        - System requirements check
POST /api/setup/complete        - Save config, create admin
POST /api/keycloak/create-admin - Call Keycloak API
POST /api/install/start         - Start Docker containers
GET  /api/install/stream        - SSE for progress
```

**App Store:**
```
GET    /api/apps/list            - Available apps
POST   /api/apps/install/:id     - Install app profile
DELETE /api/apps/uninstall/:id   - Stop & remove app
```

---

## Configuration Files

**Setup flag:** `/config/setup_complete` (JSON)
```json
{
  "completed_at": "2025-10-23T14:30:00Z",
  "admin_username": "admin",
  "installed_apps": ["grafana", "minio"]
}
```

**Orchestrator config:** `/app/config/config.json`
```json
{
  "setup_complete": false,
  "admin": {"username": "...", "email": "...", "password": "..."},
  "selected_apps": ["grafana"],
  "installed_apps": []
}
```

---

## Docker Profiles (Already Exist)

**Base services (always run):**
- postgresql, keycloak, emqx, kong, backend, frontend, nodered

**Optional (via --profile flag):**
- grafana
- minio
- portainer
- chat2db

**Install command:**
```bash
docker compose -f docker-compose-4c8g.yml \
  --profile grafana \
  --profile minio \
  up -d
```

---

## Keycloak Integration

**Endpoint:** `http://keycloak:8080/admin/realms/supos/users`

**Get token:**
```bash
curl -X POST http://keycloak:8080/realms/master/protocol/openid-connect/token \
  -d "client_id=admin-cli" \
  -d "username=admin" \
  -d "password=admin" \
  -d "grant_type=password"
```

**Create user:**
```bash
curl -X POST http://keycloak:8080/admin/realms/supos/users \
  -H "Authorization: Bearer {token}" \
  -H "Content-Type: application/json" \
  -d '{
    "username": "newadmin",
    "email": "admin@company.com",
    "enabled": true,
    "credentials": [{
      "type": "password",
      "value": "password123",
      "temporary": false
    }],
    "groups": ["/admin"]
  }'
```

---

## Kong Routing Config

**File:** `mount/kong/kong.yml`

**Routes:**
1. `/setup`, `/api/setup/*` → orchestrator (always)
2. `/api/apps/*` → orchestrator (app store)
3. `/*` → supOS frontend (after setup complete)

**Dynamic routing:** Kong checks flag file via Lua plugin or pre-flight request.

---

## Success Checkpoints (Day 1)

After Day 1, you should have:
- [ ] Flask API responds at `:8080/api/health`
- [ ] React wizard renders at `:8080`
- [ ] Ant Design components match supOS theme
- [ ] Orchestrator container builds & runs
- [ ] Can access setup wizard from host

---

## Common Issues & Fixes

**Flask can't find React dist:**
- Check `static_folder='frontend/dist'` in Flask init
- Verify `npm run build` completed
- Check file permissions

**Keycloak API fails:**
- Wait 30s after Keycloak starts (needs init time)
- Check credentials: `KEYCLOAK_ADMIN` in `.env`
- Test token fetch first before user creation

**Docker socket access denied:**
- Verify mount in docker-compose.yml: `/var/run/docker.sock:/var/run/docker.sock`
- Check orchestrator runs with Docker socket permission

**Kong routes 404:**
- Verify `kong.yml` syntax (YAML whitespace matters)
- Check Kong logs: `docker logs supos-kong`
- Test direct orchestrator access: `curl localhost:8080`

---

## Time-Saving Tips

**Build once, test often:**
- Keep React dev server running (`npm run dev`)
- Test Flask endpoints with curl before UI integration
- Use Postman/Insomnia for API testing

**Docker efficiency:**
- Cache layers: install deps before copying source
- Use `--no-cache` only when necessary
- Test containers individually before full compose

**Debugging:**
- Flask: `app.run(debug=True)` shows stack traces
- React: Browser DevTools → Network tab
- Kong: Check declarative config with `kong config parse`

---

## When You're Stuck

**Symptoms → Actions:**

| Symptom | Root Cause | Fix |
|---------|-----------|-----|
| React won't build | Missing deps | `npm install` |
| API returns 404 | Wrong route | Check Flask `@app.route()` |
| Keycloak 401 | Bad token | Re-fetch token, check expiry |
| Containers won't start | Profile mismatch | Check compose file profile names |
| Kong routes broken | Config syntax | Validate `kong.yml` YAML |

**Nuclear option:** Clean slate
```bash
docker compose down -v
rm -rf orchestrator/frontend/node_modules
docker system prune -af
# Start Day 1 from scratch
```

---

## Post-Hackathon Enhancements

**Phase 2 (if you want to continue):**
- Backup automation (pg_dump scheduler)
- Update mechanism (version bumps)
- Custom app manifests (community apps)
- App store UI in supOS sidebar

**Phase 3 (production-ready):**
- HA orchestrator (multiple replicas)
- RBAC for app installs
- ARM support
- Kubernetes Helm charts

---

## Resources

**Ant Design:** https://ant.design/components/overview/
**Flask-CORS:** https://flask-cors.readthedocs.io/
**Keycloak Admin API:** https://www.keycloak.org/docs-api/latest/rest-api/
**Docker Compose Profiles:** https://docs.docker.com/compose/profiles/
**Kong Declarative Config:** https://docs.konghq.com/gateway/latest/production/deployment-topologies/db-less-and-declarative-config/
