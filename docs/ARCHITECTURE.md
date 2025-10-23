# supOS-bedrock Architecture

**Philosophy:** Orchestrator as invisible setup layer. Disappears after first-run.

---

## System Flow

```
┌─────────────────────────────────────────────────────────────┐
│ User visits localhost:8088                                  │
└─────────────────────────────────────────────────────────────┘
                           │
                           ▼
                  ┌────────────────┐
                  │ Kong Gateway   │
                  │ (Port 8088)    │
                  └────────────────┘
                           │
                ┌──────────┴──────────┐
                │                     │
         [No flag]               [Flag exists]
                │                     │
                ▼                     ▼
    ┌───────────────────┐   ┌──────────────────┐
    │ Orchestrator      │   │ supOS Frontend   │
    │ :8080/setup       │   │ :8088/home       │
    │ (React Wizard)    │   │ (Native React)   │
    └───────────────────┘   └──────────────────┘
                │
                ▼
    ┌───────────────────────────────────┐
    │ Setup Actions:                    │
    │ 1. Keycloak API → Create Admin    │
    │ 2. Docker API → Start Profiles    │
    │ 3. Write /config/setup_complete   │
    └───────────────────────────────────┘
                │
                ▼
    ┌───────────────────────────────────┐
    │ Kong routes flip to supOS         │
    │ User sees native dashboard        │
    └───────────────────────────────────┘
```

---

## Critical Design Decisions

### 1. No supOS Source Modifications
**Why:** Zero rebuild time. Zero merge conflicts. Upgrade-safe.

**How:** Kong routing rules check flag file. Orchestrator is external sidecar.

### 2. Orchestrator Serves React
**Why:** Match supOS UI exactly. Ant Design components. Same theme.

**Where:** `orchestrator/static/` contains standalone React SPA.

**Build:** Vite builds to static files. Served by Flask.

### 3. Kong as Traffic Controller
**Why:** Already in stack. Handles routing. No nginx needed.

**Config location:** `mount/kong/kong.yml`

**Routing logic:**
```yaml
routes:
  - name: setup-wizard
    paths:
      - /setup
    strip_path: false
    methods:
      - GET
      - POST
    service:
      name: orchestrator
    plugins:
      - name: request-transformer
        config:
          add:
            headers:
              - X-Setup-Mode:true

  - name: default
    paths:
      - /
    strip_path: false
    service:
      name: frontend
```

**Dynamic routing:** Kong checks `/config/setup_complete` via Lua plugin.

### 4. Keycloak Admin Creation
**Why:** supOS backend expects Keycloak users. No direct DB insert.

**API endpoint:** `POST http://keycloak:8080/admin/realms/supos/users`

**Auth:** Use admin credentials from `.env` → `KEYCLOAK_ADMIN`/`KEYCLOAK_ADMIN_PASSWORD`

**Payload:**
```json
{
  "username": "admin",
  "email": "admin@company.com",
  "enabled": true,
  "credentials": [{
    "type": "password",
    "value": "userPassword",
    "temporary": false
  }],
  "groups": ["/admin"]
}
```

### 5. App Selection via Docker Profiles
**Why:** Already exists in `docker-compose-4c8g.yml`.

**Current profiles:**
- `base` (always runs): postgresql, keycloak, emqx, kong, backend, frontend, nodered
- `grafana`
- `minio`
- `portainer`
- `chat2db`

**Install command:**
```bash
docker compose -f docker-compose-4c8g.yml \
  --profile grafana \
  --profile minio \
  up -d
```

**Orchestrator task:** Parse checkbox selections → build command → execute.

---

## Component Breakdown

### Orchestrator (Flask + React)

**Backend (`orchestrator/app.py`):**
- Health check endpoint: `GET /api/health`
- Setup status: `GET /api/setup/status`
- System validation: `POST /api/setup/validate`
- Complete setup: `POST /api/setup/complete`
- App management: `POST /api/apps/install`, `DELETE /api/apps/uninstall`
- Keycloak integration: `POST /api/keycloak/create-admin`

**Frontend (`orchestrator/frontend/`):**
- React 18 + Vite 5
- Ant Design 5.x (matches supOS)
- Setup wizard: 4 steps
  1. Welcome + system check
  2. Admin credentials
  3. App selection (checkboxes)
  4. Installation progress
- Standalone build: `npm run build` → `orchestrator/static/`

**Deployment:**
```dockerfile
# orchestrator/Dockerfile
FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
EXPOSE 8080
CMD ["python", "app.py"]
```

### Kong Configuration

**File:** `mount/kong/kong.yml`

**Setup detection plugin (`setup-checker.lua`):**
```lua
local function check_setup()
  local file = io.open("/config/setup_complete", "r")
  if file then
    file:close()
    return true
  end
  return false
end

if not check_setup() then
  kong.response.set_header("X-Accel-Redirect", "/setup")
end
```

**Route priority:**
1. `/api/setup/*` → orchestrator (always)
2. `/api/apps/*` → orchestrator (post-install app store)
3. `/setup` → orchestrator (if no flag)
4. `/*` → supOS frontend (if flag exists)

### Setup Complete Flag

**Location:** `/config/setup_complete`

**Format:** JSON
```json
{
  "completed_at": "2025-10-23T14:30:00Z",
  "admin_username": "admin",
  "installed_apps": ["grafana", "minio"],
  "version": "1.0.0"
}
```

**Shared volume:** Mounted to orchestrator, Kong, backend.

---

## Data Flow: Setup Wizard

**Step 1: System Validation**
```
User clicks "Start" → Orchestrator checks:
  - Docker socket accessible
  - 8GB+ RAM available
  - 20GB+ disk space
  - Ports 8088, 1883, 8084 free
→ Show green checkmarks or red X
```

**Step 2: Admin Creation**
```
User fills form → POST /api/setup/complete
  ↓
Orchestrator validates:
  - Username 3-20 chars
  - Email format
  - Password 8+ chars
  ↓
Generate config.json:
  - Admin credentials
  - Random passwords for postgres, emqx, minio
  - Network settings from .env
  ↓
Call Keycloak API:
  POST /admin/realms/supos/users
  Headers: Authorization: Bearer {admin-token}
  ↓
Verify user created: GET /admin/realms/supos/users?username=admin
```

**Step 3: App Selection**
```
Show checkboxes:
  □ Grafana - Advanced visualization
  □ MinIO - Object storage  
  □ Portainer - Container management
  □ Chat2DB - Database GUI
  
User selects → Store in config.json["selected_apps"]
```

**Step 4: Installation**
```
Build Docker command:
  docker compose -f docker-compose-4c8g.yml \
    --profile grafana \
    --profile minio \
    up -d
    
Stream logs to UI via SSE:
  - Container pull progress
  - Container start status
  - Health check results
  
Wait for all containers healthy:
  - Poll docker ps every 2s
  - Timeout: 5 minutes
  
Write setup_complete flag
  
Redirect to: http://localhost:8088/home
```

---

## App Store (Post-Install)

**UI Location:** `/app-store` route in supOS frontend (added via Kong)

**Backend:** Orchestrator endpoints

**Available operations:**

**Install app:**
```bash
POST /api/apps/install
Body: {"app_id": "grafana"}

Orchestrator:
1. Check if already running
2. Execute: docker compose --profile grafana up -d
3. Update config.json["installed_apps"]
4. Return status
```

**Uninstall app:**
```bash
DELETE /api/apps/uninstall/grafana

Orchestrator:
1. Stop container: docker stop supos-grafana
2. Remove: docker rm supos-grafana
3. Update config.json
4. Return status
```

**List available:**
```bash
GET /api/apps/list

Returns:
[
  {
    "id": "grafana",
    "name": "Grafana",
    "description": "Advanced visualization",
    "installed": true,
    "status": "running"
  },
  ...
]
```

---

## Security Considerations

**Keycloak admin credentials:**
- Generated once during setup
- Stored in `/config/config.json` (0600 permissions)
- Orchestrator uses for API calls
- Rotated via app store UI

**Docker socket access:**
- Orchestrator needs read/write to `/var/run/docker.sock`
- Risk: Container escape
- Mitigation: Orchestrator runs as non-root, restricted to supOS compose files

**Network isolation:**
- Orchestrator on separate network: `supos_orchestrator_network`
- Can communicate with Kong via bridge
- Cannot directly access supOS internal services

---

## Failure Recovery

**Scenario 1: Setup interrupted mid-install**
- Detection: `setup_complete` missing but containers exist
- Solution: Orchestrator shows "Resume" button
- Action: Re-run install with `--no-recreate` flag

**Scenario 2: Keycloak admin creation fails**
- Detection: API returns 409 (user exists)
- Solution: Skip user creation, proceed
- Warn user: "Admin already exists. Use existing password."

**Scenario 3: Container fails to start**
- Detection: Health check timeout
- Solution: Show logs in UI
- Action: Offer "Retry" or "Clean & Restart"

**Scenario 4: Kong routing breaks**
- Detection: All routes 404
- Solution: Orchestrator remains on :8080 (bypass Kong)
- Action: Manual Kong config fix via Portainer

---

## Upgrade Path

**supOS version update:**
1. Stop all containers
2. Pull new images: `docker compose pull`
3. Restart: `docker compose up -d`
4. Orchestrator unchanged (decoupled)

**Orchestrator update:**
1. Build new orchestrator image
2. Stop: `docker stop supos-orchestrator`
3. Replace container
4. Start: `docker start supos-orchestrator`
5. supOS unaffected (setup_complete persists)

---

## Testing Strategy

**Unit tests:**
- Orchestrator API endpoints (pytest)
- Keycloak integration (mock API)
- Docker command builder

**Integration tests:**
- Setup wizard E2E (Playwright)
- Kong routing (curl tests)
- Container lifecycle

**Manual verification:**
- Fresh install on clean VM
- Interrupt mid-install, resume
- Uninstall app, reinstall
- Access supOS dashboard after setup

---

## Performance Targets

| Metric | Target | Measured By |
|--------|--------|-------------|
| Setup wizard load | <2s | Browser DevTools |
| System validation | <5s | API response time |
| Keycloak admin creation | <3s | API response time |
| Container start (base) | <120s | Docker logs |
| Container start (with 2 apps) | <180s | Docker logs |
| Kong routing decision | <10ms | Kong logs |

---

## Monitoring Hooks

**Orchestrator health:**
```bash
curl http://localhost:8080/api/health
# Returns: {"status": "ok", "setup_complete": true, "containers": 10}
```

**Setup status:**
```bash
curl http://localhost:8080/api/setup/status
# Returns: {"completed": true, "timestamp": "2025-10-23T14:30:00Z"}
```

**App inventory:**
```bash
curl http://localhost:8080/api/apps/list
# Returns: [{"id": "grafana", "status": "running"}, ...]
```

---

## Known Limitations

1. **Single-node only:** No Kubernetes support (yet)
2. **No RBAC in app store:** Any logged-in user can install apps
3. **No rollback:** Uninstall deletes data (add backup later)
4. **Kong plugin complexity:** Custom Lua requires expertise
5. **Orchestrator SPOF:** If Flask crashes, app store unavailable (supOS still works)

---

## Future Enhancements

**Phase 2 (Post-Hackathon):**
- Backup automation (pg_dump scheduled via cron)
- Update mechanism (pull new images, rolling restart)
- App manifest format (custom app submissions)
- RBAC for app store (admin-only installs)

**Phase 3 (Production):**
- HA orchestrator (2+ replicas behind load balancer)
- Distributed tracing (OpenTelemetry)
- SSO integration (SAML/LDAP via Keycloak)
- ARM support (multi-arch images)

---

## Success Criteria (Hackathon Demo)

**Must-Ship:**
- [ ] Setup wizard completes in <5 clicks
- [ ] Admin can login to supOS dashboard
- [ ] At least 1 optional app installs successfully
- [ ] Video shows vision clearly (<10 min)

**Should-Ship:**
- [ ] App store UI accessible post-install
- [ ] Install/uninstall without SSH/terminal
- [ ] Professional documentation (this file)

**Nice-to-Have:**
- [ ] Update mechanism (version bump)
- [ ] Automated backup (one-click export)
- [ ] ARM deployment validated
