# supOS-bedrock: 7-Day Hackathon Sprint

**Project:** Transform supOS-CE into modular platform OS  
**Timeframe:** 7 days × 3.5 hours = 24.5 total hours  
**Constraint:** Half-day work (concurrent project running)  
**Success Definition:** Shippable demo with setup wizard + app store

---

## Sprint Foundation

### Source Code Reality Check

**Backend Stack:**
- Spring Boot 2.7.x (Java 17)
- PostgreSQL + TimescaleDB
- Keycloak OAuth integration
- Maven build (`mvn clean package`)
- Build time: ~3-5 minutes

**Frontend Stack:**
- React 18 + Vite 4
- react-router-dom v6
- Ant Design components
- npm build: ~2-3 minutes

**Docker Setup:**
- Base: `docker-compose.yml` (orchestrator only)
- Services: `docker-compose-4c8g.yml` / `docker-compose-8c16g.yml`
- Profiles: Already exists for optional services
- Init scripts: `bin/init/*.sh` (35 scripts)

**Critical Discovery:**  
Profiles already work. We leverage, not rebuild.

---

## Architecture: Before vs After

### Current State (supOS-CE)
```
User → Run install.sh → Edit docker-compose → All services start → Manual config
```

**Problems:**
1. All-or-nothing installation
2. No post-install app additions
3. No update mechanism
4. Manual backup only

### Target State (supOS-bedrock)
```
User → Visit localhost:8088 → Setup wizard → Select apps → Platform ready
       ↓
   App Store UI → Install more apps → One-click updates/backups
```

**Wins:**
1. Zero SSH required
2. Apps added post-install
3. Automated updates
4. One-click backups

---

## Core Components

### Base Stack (Always Installed)
Required for minimal UNS functionality:
- PostgreSQL (metadata)
- TimescaleDB (time-series)
- Keycloak (auth)
- EMQX (MQTT)
- Kong (gateway)
- Backend (supOS engine)
- Frontend (UI)
- Node-RED (flows)

**Why these:** Can model devices, create flows, visualize data. Minimum viable UNS.

### App Store Apps (Optional)
- Grafana (advanced visualization)
- MinIO (object storage)
- Portainer (container UI)
- Chat2DB (database GUI)
- ELK Stack (logging)
- Gitea (git hosting)

---

## 7-Day Sprint Breakdown

### Day 1: Build Pipeline + Architecture Map (3.5h)

**Objective:** Prove we can build modified images.

**Tasks:**

**1.1 Map Current Boot Flow (1h)**
```bash
# Investigate:
cat backend/src/main/resources/application.yml
# Find: How does backend detect first-run?
# Find: Where does it redirect on startup?

cat frontend/src/App.jsx
# Find: Routing logic
# Find: Auth check flow
```

Document findings in `docs/ARCHITECTURE.md`:
- Backend entry point
- Frontend routing structure
- Keycloak integration points
- First-run detection mechanism (if exists)

**1.2 Create Build Scripts (1.5h)**

File: `orchestrator/builder.py`
```python
#!/usr/bin/env python3
import subprocess
import shutil
from pathlib import Path

def build_backend():
    """Build custom backend image"""
    print("Building backend...")
    
    # Copy source to build dir
    shutil.copytree("./backend", "/tmp/build-backend", dirs_exist_ok=True)
    
    # Build with Maven
    result = subprocess.run(
        ["mvn", "clean", "package", "-DskipTests"],
        cwd="/tmp/build-backend",
        capture_output=True
    )
    
    if result.returncode != 0:
        print(f"Backend build failed: {result.stderr.decode()}")
        return False
    
    # Build Docker image
    subprocess.run([
        "docker", "build",
        "-t", "supos-bedrock-backend:dev",
        "/tmp/build-backend"
    ])
    
    return True

def build_frontend():
    """Build custom frontend image"""
    print("Building frontend...")
    
    shutil.copytree("./frontend", "/tmp/build-frontend", dirs_exist_ok=True)
    
    # Install deps and build
    subprocess.run(["npm", "install"], cwd="/tmp/build-frontend")
    subprocess.run(["npm", "run", "build"], cwd="/tmp/build-frontend")
    
    # Build Docker image
    subprocess.run([
        "docker", "build",
        "-t", "supos-bedrock-platform:dev",
        "/tmp/build-frontend"
    ])
    
    return True

if __name__ == "__main__":
    backend_ok = build_backend()
    frontend_ok = build_frontend()
    
    if backend_ok and frontend_ok:
        print("✓ All builds successful")
    else:
        print("✗ Build failed")
        exit(1)
```

**1.3 Test Vanilla Build (1h)**
```bash
# Run builder on unmodified source
python3 orchestrator/builder.py

# Verify images created
docker images | grep supos-bedrock

# Test: Deploy with custom images
# Update docker-compose-4c8g.yml:
#   backend.image: supos-bedrock-backend:dev
#   frontend.image: supos-bedrock-platform:dev

docker compose -f docker-compose-4c8g.yml up -d

# Verify: Visit localhost:8088
# Should work identically to original
```

**Day 1 Checkpoint:**
- [ ] Build script runs without errors
- [ ] Custom images boot successfully
- [ ] Platform functional (can login, view dashboard)
- [ ] Build time documented (<10 minutes total)

**If checkpoint fails:** Path B: Use runtime injection instead of rebuild. Continue to Day 2 with original images.

---

### Day 2: Minimal Backend Injection (3.5h)

**Objective:** Prove modification pipeline works end-to-end.

**Tasks:**

**2.1 Add Setup Status Endpoint (1.5h)**

File: `backend/src/main/java/com/supcon/supos/controller/SetupController.java`
```java
package com.supcon.supos.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.Map;

@RestController
@RequestMapping("/api/setup")
public class SetupController {
    
    @Autowired
    private KeycloakService keycloakService;
    
    @GetMapping("/status")
    public ResponseEntity<Map<String, Object>> getSetupStatus() {
        // Check if admin user exists
        boolean hasAdmin = keycloakService.hasAdminUser();
        
        return ResponseEntity.ok(Map.of(
            "setupComplete", hasAdmin,
            "needsSetup", !hasAdmin
        ));
    }
}
```

Create supporting service:
File: `backend/src/main/java/com/supcon/supos/service/KeycloakService.java`
```java
package com.supcon.supos.service;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.client.RestTemplate;

@Service
public class KeycloakService {
    
    @Value("${keycloak.auth-server-url}")
    private String keycloakUrl;
    
    public boolean hasAdminUser() {
        // Query Keycloak API for admin user
        // For now: check if any users exist
        try {
            RestTemplate rest = new RestTemplate();
            // Simplified: Check realm users endpoint
            // Production: Use Keycloak admin client
            return false; // First-run = no admin
        } catch (Exception e) {
            return false;
        }
    }
}
```

**2.2 Add Frontend Test Page (1h)**

File: `frontend/src/pages/SetupTest.jsx`
```jsx
import { useEffect, useState } from 'react';
import { Card, Tag } from 'antd';

export default function SetupTest() {
    const [status, setStatus] = useState(null);
    const [loading, setLoading] = useState(true);
    
    useEffect(() => {
        fetch('/api/setup/status')
            .then(r => r.json())
            .then(data => {
                setStatus(data);
                setLoading(false);
            })
            .catch(err => {
                console.error(err);
                setLoading(false);
            });
    }, []);
    
    return (
        <Card title="Setup Status Test" loading={loading}>
            {status && (
                <>
                    <p>Setup Complete: 
                        <Tag color={status.setupComplete ? 'green' : 'red'}>
                            {status.setupComplete ? 'Yes' : 'No'}
                        </Tag>
                    </p>
                    <p>Needs Setup: 
                        <Tag color={status.needsSetup ? 'orange' : 'blue'}>
                            {status.needsSetup ? 'Yes' : 'No'}
                        </Tag>
                    </p>
                </>
            )}
        </Card>
    );
}
```

Add route in `frontend/src/router/index.jsx`:
```jsx
import SetupTest from '../pages/SetupTest';

// In routes array:
{
    path: '/setup-test',
    element: <SetupTest />
}
```

**2.3 Build and Test (1h)**
```bash
# Rebuild with modifications
python3 orchestrator/builder.py

# Deploy
docker compose down
docker compose -f docker-compose-4c8g.yml up -d

# Wait for backend healthy
sleep 30

# Test endpoint directly
curl http://localhost:8088/api/setup/status
# Should return: {"setupComplete":false,"needsSetup":true}

# Test frontend page
# Visit: http://localhost:8088/setup-test
# Should show status tags
```

**Day 2 Checkpoint:**
- [ ] Backend compiles with new controller
- [ ] Endpoint returns JSON
- [ ] Frontend page renders
- [ ] No regression (original features work)

**If checkpoint fails:** Investigate logs. Check Spring Boot auto-config. Verify Keycloak connection.

---

### Day 3: Setup Wizard Backend (3.5h)

**Objective:** Backend creates admin user via Keycloak API.

**Tasks:**

**3.1 Research Keycloak Integration (0.5h)**
```bash
# Find existing Keycloak config
grep -r "keycloak" backend/src/main/resources/

# Check environment variables
cat .env | grep KEYCLOAK

# Find: Admin credentials
# Find: Realm name
# Find: Client ID
```

Document findings:
- Keycloak URL: `http://keycloak:8080`
- Realm: `supos`
- Admin user: From `KEYCLOAK_ADMIN` env var

**3.2 Implement Admin Creation (2h)**

File: `backend/src/main/java/com/supcon/supos/service/KeycloakService.java` (enhance)
```java
import org.keycloak.admin.client.Keycloak;
import org.keycloak.admin.client.KeycloakBuilder;
import org.keycloak.representations.idm.UserRepresentation;
import org.keycloak.representations.idm.CredentialRepresentation;

@Service
public class KeycloakService {
    
    @Value("${keycloak.auth-server-url}")
    private String serverUrl;
    
    @Value("${keycloak.realm}")
    private String realm;
    
    @Value("${keycloak.admin.username}")
    private String adminUsername;
    
    @Value("${keycloak.admin.password}")
    private String adminPassword;
    
    public void createAdminUser(String username, String email, String password) {
        // Create Keycloak admin client
        Keycloak keycloak = KeycloakBuilder.builder()
            .serverUrl(serverUrl)
            .realm("master")
            .username(adminUsername)
            .password(adminPassword)
            .clientId("admin-cli")
            .build();
        
        // Create user representation
        UserRepresentation user = new UserRepresentation();
        user.setUsername(username);
        user.setEmail(email);
        user.setEnabled(true);
        
        // Set password
        CredentialRepresentation credential = new CredentialRepresentation();
        credential.setType(CredentialRepresentation.PASSWORD);
        credential.setValue(password);
        credential.setTemporary(false);
        user.setCredentials(List.of(credential));
        
        // Create user in realm
        keycloak.realm(realm).users().create(user);
        
        // Assign admin role (implementation depends on role setup)
        // This is simplified - check actual role structure
    }
}
```

**3.3 Create Setup Endpoints (1h)**

File: `backend/src/main/java/com/supcon/supos/controller/SetupController.java` (enhance)
```java
@PostMapping("/create-admin")
public ResponseEntity<Map<String, String>> createAdmin(
    @RequestBody Map<String, String> request
) {
    try {
        String username = request.get("username");
        String email = request.get("email");
        String password = request.get("password");
        
        // Validate inputs
        if (username == null || password == null) {
            return ResponseEntity.badRequest()
                .body(Map.of("error", "Missing required fields"));
        }
        
        // Create user
        keycloakService.createAdminUser(username, email, password);
        
        // Mark setup as complete
        // Write to config file or database
        markSetupComplete();
        
        return ResponseEntity.ok(Map.of(
            "message", "Admin user created successfully",
            "username", username
        ));
        
    } catch (Exception e) {
        return ResponseEntity.status(500)
            .body(Map.of("error", e.getMessage()));
    }
}

@PostMapping("/select-apps")
public ResponseEntity<Map<String, String>> selectApps(
    @RequestBody List<String> apps
) {
    // Write selected apps to config.json
    Path configPath = Paths.get("/config/config.json");
    
    Map<String, Object> config = new HashMap<>();
    config.put("selected_apps", apps);
    config.put("timestamp", System.currentTimeMillis());
    
    ObjectMapper mapper = new ObjectMapper();
    mapper.writeValue(configPath.toFile(), config);
    
    return ResponseEntity.ok(Map.of("message", "Apps saved"));
}

private void markSetupComplete() {
    // Write setup_complete flag to persistent storage
    Path flagPath = Paths.get("/config/setup_complete");
    Files.createFile(flagPath);
}
```

**Day 3 Checkpoint:**
- [ ] Can call `POST /api/setup/create-admin` with curl
- [ ] User appears in Keycloak admin console
- [ ] Can login with new credentials
- [ ] config.json written correctly

**If checkpoint fails:** Fallback: Direct PostgreSQL insert into Keycloak tables (ugly but works).

---

### Day 4: Setup Wizard UI + App Install (3.5h)

**Objective:** Complete wizard. Install selected apps.

**Tasks:**

**4.1 Build Wizard Component (2h)**

File: `frontend/src/pages/Setup/SetupWizard.jsx`
```jsx
import { useState } from 'react';
import { Steps, Button, Form, Input, Checkbox, message } from 'antd';
import { useNavigate } from 'react-router-dom';

const apps = [
    { id: 'grafana', name: 'Grafana', description: 'Visualization' },
    { id: 'minio', name: 'MinIO', description: 'Object storage' },
    { id: 'portainer', name: 'Portainer', description: 'Container UI' },
];

export default function SetupWizard() {
    const [current, setCurrent] = useState(0);
    const [adminForm] = Form.useForm();
    const [selectedApps, setSelectedApps] = useState([]);
    const [loading, setLoading] = useState(false);
    const navigate = useNavigate();
    
    const steps = [
        { title: 'Welcome' },
        { title: 'Create Admin' },
        { title: 'Select Apps' },
        { title: 'Install' }
    ];
    
    const handleCreateAdmin = async () => {
        const values = await adminForm.validateFields();
        
        setLoading(true);
        try {
            const response = await fetch('/api/setup/create-admin', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(values)
            });
            
            if (!response.ok) throw new Error('Failed to create admin');
            
            message.success('Admin created successfully');
            setCurrent(2);
        } catch (error) {
            message.error(error.message);
        } finally {
            setLoading(false);
        }
    };
    
    const handleInstall = async () => {
        setLoading(true);
        try {
            // Save selected apps
            await fetch('/api/setup/select-apps', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(selectedApps)
            });
            
            // Trigger installation
            await fetch('/api/setup/install', {
                method: 'POST'
            });
            
            message.success('Installation complete!');
            
            // Wait and redirect
            setTimeout(() => navigate('/'), 3000);
            
        } catch (error) {
            message.error(error.message);
        } finally {
            setLoading(false);
        }
    };
    
    return (
        <div style={{ maxWidth: 800, margin: '50px auto', padding: 24 }}>
            <Steps current={current} items={steps} />
            
            <div style={{ marginTop: 40 }}>
                {current === 0 && (
                    <div>
                        <h2>Welcome to supOS-bedrock</h2>
                        <p>Let's set up your industrial platform.</p>
                        <Button type="primary" onClick={() => setCurrent(1)}>
                            Start Setup
                        </Button>
                    </div>
                )}
                
                {current === 1 && (
                    <Form form={adminForm} layout="vertical">
                        <Form.Item 
                            label="Username" 
                            name="username"
                            rules={[{ required: true }]}
                        >
                            <Input />
                        </Form.Item>
                        
                        <Form.Item 
                            label="Email" 
                            name="email"
                            rules={[{ required: true, type: 'email' }]}
                        >
                            <Input />
                        </Form.Item>
                        
                        <Form.Item 
                            label="Password" 
                            name="password"
                            rules={[{ required: true, min: 8 }]}
                        >
                            <Input.Password />
                        </Form.Item>
                        
                        <Button 
                            type="primary" 
                            onClick={handleCreateAdmin}
                            loading={loading}
                        >
                            Create Admin
                        </Button>
                    </Form>
                )}
                
                {current === 2 && (
                    <div>
                        <h3>Select Apps to Install</h3>
                        <Checkbox.Group 
                            options={apps.map(a => ({ 
                                label: `${a.name} - ${a.description}`,
                                value: a.id 
                            }))}
                            value={selectedApps}
                            onChange={setSelectedApps}
                        />
                        <br /><br />
                        <Button type="primary" onClick={() => setCurrent(3)}>
                            Continue
                        </Button>
                    </div>
                )}
                
                {current === 3 && (
                    <div>
                        <h3>Ready to Install</h3>
                        <p>Selected apps: {selectedApps.join(', ') || 'None'}</p>
                        <Button 
                            type="primary" 
                            onClick={handleInstall}
                            loading={loading}
                        >
                            Install Now
                        </Button>
                    </div>
                )}
            </div>
        </div>
    );
}
```

Add route to make it accessible:
```jsx
// In router/index.jsx
{
    path: '/setup',
    element: <SetupWizard />
}
```

**4.2 Implement Install Endpoint (1h)**

File: `backend/src/main/java/com/supcon/supos/controller/SetupController.java` (add)
```java
@PostMapping("/install")
public ResponseEntity<Map<String, String>> installPlatform() {
    try {
        // Read selected apps from config
        Path configPath = Paths.get("/config/config.json");
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> config = mapper.readValue(
            configPath.toFile(), 
            Map.class
        );
        
        List<String> apps = (List<String>) config.get("selected_apps");
        
        // Build docker-compose command with profiles
        List<String> command = new ArrayList<>();
        command.add("docker");
        command.add("compose");
        command.add("-f");
        command.add("/app/docker-compose-4c8g.yml");
        
        for (String app : apps) {
            command.add("--profile");
            command.add(app);
        }
        
        command.add("up");
        command.add("-d");
        
        // Execute command
        ProcessBuilder pb = new ProcessBuilder(command);
        pb.redirectErrorStream(true);
        Process process = pb.start();
        
        // Don't wait - let it run async
        // In production: Use proper job queue
        
        return ResponseEntity.ok(Map.of(
            "message", "Installation started",
            "apps", String.join(", ", apps)
        ));
        
    } catch (Exception e) {
        return ResponseEntity.status(500)
            .body(Map.of("error", e.getMessage()));
    }
}
```

**4.3 Integration Test (0.5h)**
```bash
# Rebuild everything
python3 orchestrator/builder.py

# Deploy
docker compose down
docker compose -f docker-compose-4c8g.yml up -d

# Visit: http://localhost:8088/setup
# Complete wizard:
# - Step 1: Click start
# - Step 2: Create admin (test/test@test.com/testpass123)
# - Step 3: Select Grafana
# - Step 4: Install

# Verify Grafana starts
docker ps | grep grafana

# Check logs
docker logs supos-grafana
```

**Day 4 Checkpoint:**
- [ ] Wizard completes all steps
- [ ] Admin user can login
- [ ] Selected apps start automatically
- [ ] Grafana accessible at /grafana

**If checkpoint fails:** Check Docker socket mount. Verify backend can execute docker commands. Check profiles in compose file.

---

### Day 5: App Store UI (3.5h)

**Objective:** Post-install app management page.

**Tasks:**

**5.1 Create App Store Page (2h)**

File: `frontend/src/pages/AppStore/AppStore.jsx`
```jsx
import { useEffect, useState } from 'react';
import { Card, Button, Tag, Row, Col, message } from 'antd';

const appCatalog = [
    {
        id: 'grafana',
        name: 'Grafana',
        description: 'Advanced visualization and dashboards',
        icon: '📊'
    },
    {
        id: 'minio',
        name: 'MinIO',
        description: 'S3-compatible object storage',
        icon: '🗄️'
    },
    {
        id: 'portainer',
        name: 'Portainer',
        description: 'Docker container management',
        icon: '🐳'
    },
];

export default function AppStore() {
    const [installedApps, setInstalledApps] = useState([]);
    const [loading, setLoading] = useState({});
    
    useEffect(() => {
        fetchInstalledApps();
    }, []);
    
    const fetchInstalledApps = async () => {
        try {
            const response = await fetch('/api/apps/list');
            const data = await response.json();
            setInstalledApps(data.installed || []);
        } catch (error) {
            console.error(error);
        }
    };
    
    const handleInstall = async (appId) => {
        setLoading({ ...loading, [appId]: true });
        
        try {
            const response = await fetch(`/api/apps/install/${appId}`, {
                method: 'POST'
            });
            
            if (!response.ok) throw new Error('Install failed');
            
            message.success(`${appId} installed successfully`);
            fetchInstalledApps();
            
        } catch (error) {
            message.error(error.message);
        } finally {
            setLoading({ ...loading, [appId]: false });
        }
    };
    
    const handleUninstall = async (appId) => {
        setLoading({ ...loading, [appId]: true });
        
        try {
            const response = await fetch(`/api/apps/uninstall/${appId}`, {
                method: 'DELETE'
            });
            
            if (!response.ok) throw new Error('Uninstall failed');
            
            message.success(`${appId} uninstalled`);
            fetchInstalledApps();
            
        } catch (error) {
            message.error(error.message);
        } finally {
            setLoading({ ...loading, [appId]: false });
        }
    };
    
    return (
        <div style={{ padding: 24 }}>
            <h1>App Store</h1>
            <p>Extend your platform with official apps</p>
            
            <Row gutter={[16, 16]}>
                {appCatalog.map(app => {
                    const isInstalled = installedApps.includes(app.id);
                    
                    return (
                        <Col key={app.id} xs={24} sm={12} md={8}>
                            <Card
                                title={
                                    <span>
                                        {app.icon} {app.name}
                                    </span>
                                }
                                extra={
                                    isInstalled 
                                        ? <Tag color="green">Installed</Tag>
                                        : <Tag>Available</Tag>
                                }
                            >
                                <p>{app.description}</p>
                                
                                {isInstalled ? (
                                    <Button 
                                        danger
                                        loading={loading[app.id]}
                                        onClick={() => handleUninstall(app.id)}
                                    >
                                        Uninstall
                                    </Button>
                                ) : (
                                    <Button 
                                        type="primary"
                                        loading={loading[app.id]}
                                        onClick={() => handleInstall(app.id)}
                                    >
                                        Install
                                    </Button>
                                )}
                            </Card>
                        </Col>
                    );
                })}
            </Row>
        </div>
    );
}
```

Add menu item in main layout:
```jsx
// In layout/menu config
{
    key: 'app-store',
    label: 'App Store',
    path: '/app-store'
}
```

**5.2 Backend App Management (1h)**

File: `backend/src/main/java/com/supcon/supos/controller/AppController.java` (new)
```java
package com.supcon.supos.controller;

import org.springframework.web.bind.annotation.*;
import java.util.*;

@RestController
@RequestMapping("/api/apps")
public class AppController {
    
    @GetMapping("/list")
    public ResponseEntity<Map<String, Object>> listApps() {
        // Read running containers
        List<String> installed = getInstalledApps();
        
        return ResponseEntity.ok(Map.of(
            "installed", installed,
            "available", Arrays.asList("grafana", "minio", "portainer")
        ));
    }
    
    @PostMapping("/install/{appId}")
    public ResponseEntity<Map<String, String>> installApp(
        @PathVariable String appId
    ) {
        try {
            // docker compose --profile {appId} up -d
            ProcessBuilder pb = new ProcessBuilder(
                "docker", "compose",
                "-f", "/app/docker-compose-4c8g.yml",
                "--profile", appId,
                "up", "-d"
            );
            
            pb.start();
            
            return ResponseEntity.ok(Map.of(
                "message", appId + " installation started"
            ));
            
        } catch (Exception e) {
            return ResponseEntity.status(500)
                .body(Map.of("error", e.getMessage()));
        }
    }
    
    @DeleteMapping("/uninstall/{appId}")
    public ResponseEntity<Map<String, String>> uninstallApp(
        @PathVariable String appId
    ) {
        try {
            // docker stop {service} && docker rm {service}
            ProcessBuilder pb = new ProcessBuilder(
                "docker", "stop", "supos-" + appId
            );
            pb.start().waitFor();
            
            new ProcessBuilder("docker", "rm", "supos-" + appId)
                .start()
                .waitFor();
            
            return ResponseEntity.ok(Map.of(
                "message", appId + " uninstalled"
            ));
            
        } catch (Exception e) {
            return ResponseEntity.status(500)
                .body(Map.of("error", e.getMessage()));
        }
    }
    
    private List<String> getInstalledApps() {
        // Query docker ps for running containers
        // Simplified implementation
        return new ArrayList<>();
    }
}
```

**5.3 Test (0.5h)**
```bash
# Rebuild
python3 orchestrator/builder.py
docker compose down && docker compose -f docker-compose-4c8g.yml up -d

# Visit: http://localhost:8088/app-store
# Try: Install MinIO
# Verify: Container appears in docker ps
# Try: Uninstall MinIO
# Verify: Container stopped
```

**Day 5 Checkpoint:**
- [ ] App store page renders
- [ ] Install button works
- [ ] App container starts
- [ ] Uninstall removes container

**If checkpoint fails:** Add debug logs. Check Docker API connectivity. Verify profile names match compose file.

---

### Day 6: Polish + Documentation (3.5h)

**Objective:** Production-ready codebase.

**Tasks:**

**6.1 Bug Fixing (1.5h)**

Run full flow 3 times:
1. Fresh install → Setup wizard → App store
2. Install all apps → Uninstall all
3. Test error cases (wrong password, missing fields)

Document bugs in `docs/KNOWN-ISSUES.md`.

Fix critical bugs only. Defer nice-to-haves.

**6.2 Update Documentation (1h)**

File: `docs/ARCHITECTURE.md`
```markdown
# supOS-bedrock Architecture

## Component Overview

### Base Stack (8 containers)
- PostgreSQL: Relational data
- TimescaleDB: Time-series data
- Keycloak: Identity & SSO
- EMQX: MQTT broker
- Kong: API gateway
- Backend: Spring Boot API
- Frontend: React SPA
- Node-RED: Flow orchestration

### Optional Apps
- Grafana, MinIO, Portainer, etc.
- Installed via App Store UI

## Boot Sequence

1. User visits localhost:8088
2. Backend checks `/config/setup_complete`
3. If missing → 302 redirect to `/setup`
4. Wizard creates admin user
5. Wizard installs selected apps
6. Redirect to `/home`

## API Endpoints

### Setup
- GET /api/setup/status
- POST /api/setup/create-admin
- POST /api/setup/select-apps
- POST /api/setup/install

### Apps
- GET /api/apps/list
- POST /api/apps/install/{id}
- DELETE /api/apps/uninstall/{id}
```

File: `docs/INSTALLATION.md`
```markdown
# Installation Guide

## Prerequisites
- Docker 26+
- Docker Compose v2
- 8GB RAM minimum
- 20GB disk space

## Quick Start

1. Clone repo:
   ```bash
   git clone --recursive https://github.com/YourUsername/supOS-bedrock.git
   cd supOS-bedrock
   ```

2. Start platform:
   ```bash
   docker compose up -d
   ```

3. Visit setup wizard:
   ```
   http://localhost:8088/setup
   ```

4. Follow wizard steps:
   - Create admin account
   - Select apps to install
   - Wait for installation (~5 minutes)

## Post-Install

Access app store at: `/app-store`

Add more apps anytime without reinstalling.
```

**6.3 README Enhancement (1h)**

Add these sections:

**Demo Screenshots:**
```markdown
## Screenshots

### Setup Wizard
![Setup](./docs/images/setup-wizard.png)

### App Store
![Apps](./docs/images/app-store.png)
```

**Comparison Table:**
```markdown
## supOS-CE vs supOS-bedrock

| Feature | CE | bedrock |
|---------|-----|---------|
| Installation | Manual scripts | Web wizard |
| Add apps | Reinstall | App store |
| Updates | Manual | One-click |
| Backups | DIY | Automated |
```

**Day 6 Checkpoint:**
- [ ] No critical bugs
- [ ] All docs updated
- [ ] README professional
- [ ] Screenshots captured

---

### Day 7: Demo Video + Submission (3.5h)

**Objective:** Deliverables ready for judges.

**Tasks:**

**7.1 Script Video Narrative (0.5h)**

**Outline:**
1. Hook (0:30): "Industrial software is broken. Here's why."
2. Problem (1:00): Show monolithic install pain
3. Solution (2:00): Setup wizard walkthrough
4. Platform angle (2:00): App store demo
5. Technical depth (2:00): Show code changes
6. Vision (1:00): "Nextcloud for Industrial"
7. Call to action (0:30): "Try it. Fork it. Build on it."

Total: ~9 minutes

**7.2 Record Demo (2h)**

**Setup:**
- Clean Docker environment
- Screen recording tool ready
- Test audio levels

**Recording order:**
1. Terminal: `docker compose up -d`
2. Browser: Visit localhost:8088
3. Wizard: Create admin, select apps
4. Platform: Show MQTT, Node-RED, dashboard
5. App Store: Install Grafana live
6. Code tour: Show backend/frontend changes
7. Terminal: Show docker ps output

**Pro tips:**
- Rehearse twice before recording
- Have backup plan if demo breaks
- Record in segments, edit together

**7.3 Final Polish (1h)**

- Video editing (trim, add titles)
- Upload to YouTube (unlisted)
- Final README pass
- Create GitHub release: `v1.0.0-hackathon`
- Test installation on clean machine

**Day 7 Checkpoint:**
- [ ] Video uploaded (<10 minutes)
- [ ] GitHub release tagged
- [ ] README has video embed
- [ ] Submission form completed

---

## Risk Mitigation Matrix

| Risk | Probability | Mitigation | Fallback |
|------|------------|-----------|----------|
| Backend build fails | Medium | Test early (Day 1) | Runtime injection via Java agent |
| Keycloak API auth fails | Low | Use admin credentials from .env | Direct PostgreSQL insert |
| Docker socket access denied | Medium | Mount `/var/run/docker.sock` | Shell script executor |
| Time overruns | High | Cut Day 5, 6 features | Submit with Days 1-4 only |
| Frontend build crashes | Low | Use Vite's fast rebuild | Serve static HTML via Kong |

---

## Success Criteria

### Must-Ship (Minimum Viable Demo)
- [ ] Setup wizard creates admin user
- [ ] App selection during first-run
- [ ] At least 1 app installs successfully
- [ ] Video demonstrates vision clearly

### Should-Ship (Competitive Edge)
- [ ] Post-install app store works
- [ ] Install/uninstall without SSH
- [ ] Professional documentation

### Nice-to-Have (Stretch)
- [ ] Update mechanism
- [ ] Backup automation
- [ ] ARM deployment validation

**Threshold:** Must-Ship = Submittable. Should-Ship = Competitive. Nice-to-Have = Impressive.

---

## Daily Discipline

**Every session (3.5h):**
1. **First 15 min:** Review yesterday's checkpoint. Fix blockers.
2. **Middle 3h:** Execute tasks. Code -> Test -> Document.
3. **Last 15 min:** Record checkpoint status. Plan tomorrow.

**Checkpoint Protocol:**
- All green? → Proceed to next day.
- One red? → Debug 1 hour max, then pivot.
- Two red? → Activate fallback plan immediately.

**No sunk cost fallacy.** If a path takes >2 hours, switch paths.

---

## Submission Checklist

**Repository:**
- [ ] README has clear positioning
- [ ] Video embedded (YouTube link)
- [ ] Installation instructions work
- [ ] Code clean (no debug prints, TODOs resolved)
- [ ] License file present

**Video:**
- [ ] Under 10 minutes
- [ ] Shows problem clearly
- [ ] Demonstrates solution end-to-end
- [ ] Explains "platform OS" vision
- [ ] Audio clear

**Hackathon Form:**
- [ ] Video link submitted
- [ ] Repo link submitted
- [ ] Team info complete
- [ ] Innovation statement (<200 words)

---

## Post-Hackathon Roadmap

If this succeeds, next phases:

**Phase 2: App Ecosystem (Weeks 2-4)**
- App manifest format (JSON)
- Plugin API for custom apps
- Community app submissions

**Phase 3: Enterprise Features (Months 2-3)**
- RBAC and audit logs
- HA clustering (multi-node)
- LDAP/SAML integration

**Phase 4: Cloud Deploy (Month 4)**
- One-click AWS/Azure/GCP
- Kubernetes Helm charts
- Managed hosting option
