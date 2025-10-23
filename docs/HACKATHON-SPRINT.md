# supOS-bedrock: 7-Day Sprint

**Strategy:** Orchestrator as invisible setup layer. Zero supOS modifications.
**Timeline:** 7 days × 3.5 hours = 24.5 total hours
**Success:** Setup wizard → App selection → Native supOS experience

---

## Architecture Summary

```
Kong Gateway (:8088)
    │
    ├─→ [No flag] → Orchestrator React UI (:8080)
    │                   ↓
    │              Setup Wizard
    │                   ↓
    │              Keycloak API + Docker Profiles
    │                   ↓
    │              Write /config/setup_complete
    │
    └─→ [Flag exists] → supOS Frontend (native)
```

**Key principle:** Orchestrator serves React wizard styled with Ant Design. After setup, Kong routes directly to supOS. User never knows orchestrator exists.

---

## Day 1: Orchestrator Foundation (3.5h)

**Objective:** Flask backend + basic routing + flag system working.

### 1.1 Create Flask API Structure (1.5h)

**File:** `orchestrator/app.py` (replace existing)

```python
#!/usr/bin/env python3
import os
import json
import docker
from flask import Flask, jsonify, request, send_from_directory
from flask_cors import CORS

app = Flask(__name__, static_folder='static', static_url_path='')
CORS(app)

CONFIG_FILE = '/app/config/config.json'
SETUP_FLAG = '/config/setup_complete'
WORKSPACE = os.getenv('SUPOS_WORKSPACE', '/workspace')

client = docker.from_env()


# ==================== HELPERS ====================

def load_config():
    """Load or initialize config."""
    if os.path.exists(CONFIG_FILE):
        with open(CONFIG_FILE, 'r') as f:
            return json.load(f)
    
    # Default config
    return {
        "setup_complete": False,
        "admin": {},
        "network": {
            "domain": os.getenv("ENTRANCE_DOMAIN", "127.0.0.1"),
            "port": int(os.getenv("ENTRANCE_PORT", 8088)),
            "protocol": "http"
        },
        "system": {
            "volumes_path": os.getenv("VOLUMES_PATH", "/volumes/supos/data"),
            "resource_spec": os.getenv("OS_RESOURCE_SPEC", "1"),
            "platform_type": "linux"
        },
        "selected_apps": [],
        "installed_apps": []
    }


def save_config(config):
    """Persist config to disk."""
    os.makedirs(os.path.dirname(CONFIG_FILE), exist_ok=True)
    with open(CONFIG_FILE, 'w') as f:
        json.dump(config, f, indent=2)


def is_setup_complete():
    """Check if setup flag exists."""
    return os.path.exists(SETUP_FLAG)


# ==================== ROUTES ====================

@app.route('/')
def index():
    """Serve React app."""
    if is_setup_complete():
        return jsonify({"redirect": "http://localhost:8088/home"}), 302
    return send_from_directory('static', 'index.html')


@app.route('/api/health')
def health():
    """Health check."""
    return jsonify({
        "status": "ok",
        "setup_complete": is_setup_complete()
    })


@app.route('/api/setup/status')
def setup_status():
    """Check setup state."""
    config = load_config()
    return jsonify({
        "completed": is_setup_complete(),
        "config": config if not is_setup_complete() else None
    })


@app.route('/api/setup/validate', methods=['POST'])
def validate_system():
    """Validate system requirements."""
    issues = []
    warnings = []
    
    # Check Docker
    try:
        client.ping()
    except Exception as e:
        issues.append(f"Docker not accessible: {e}")
    
    # Check disk space (simplified)
    stat = os.statvfs('/')
    free_gb = (stat.f_bavail * stat.f_frsize) / (1024**3)
    if free_gb < 20:
        issues.append(f"Low disk space: {free_gb:.1f}GB (need 20GB)")
    
    # Check volumes path
    volumes_path = os.getenv('VOLUMES_PATH')
    if not os.path.exists(volumes_path):
        issues.append(f"VOLUMES_PATH not mounted: {volumes_path}")
    elif not os.access(volumes_path, os.W_OK):
        issues.append(f"VOLUMES_PATH not writable: {volumes_path}")
    
    return jsonify({
        "valid": len(issues) == 0,
        "issues": issues,
        "warnings": warnings
    })


@app.route('/api/setup/complete', methods=['POST'])
def complete_setup():
    """Finalize setup and start installation."""
    data = request.get_json()
    config = load_config()
    
    # Save admin info
    config['admin'] = {
        "username": data.get('username'),
        "email": data.get('email'),
        "password": data.get('password')  # TODO: Hash before prod
    }
    
    # Save selected apps
    config['selected_apps'] = data.get('apps', [])
    
    save_config(config)
    
    return jsonify({"message": "Configuration saved"}), 200


@app.route('/api/apps/list')
def list_apps():
    """List available apps."""
    config = load_config()
    installed = config.get('installed_apps', [])
    
    apps = [
        {
            "id": "grafana",
            "name": "Grafana",
            "description": "Advanced visualization and dashboards",
            "installed": "grafana" in installed
        },
        {
            "id": "minio",
            "name": "MinIO",
            "description": "S3-compatible object storage",
            "installed": "minio" in installed
        },
        {
            "id": "portainer",
            "name": "Portainer",
            "description": "Docker container management UI",
            "installed": "portainer" in installed
        },
        {
            "id": "chat2db",
            "name": "Chat2DB",
            "description": "AI-powered database GUI",
            "installed": "chat2db" in installed
        }
    ]
    
    return jsonify(apps)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=False)
```

**Test:**
```bash
cd orchestrator
python3 app.py

# In another terminal:
curl http://localhost:8080/api/health
curl http://localhost:8080/api/apps/list
```

**Checkpoint:**
- [ ] Flask starts without errors
- [ ] `/api/health` returns JSON
- [ ] `/api/apps/list` shows 4 apps

---

### 1.2 Setup React Frontend (1.5h)

**Initialize:**
```bash
cd orchestrator
npm create vite@latest frontend -- --template react-ts
cd frontend
npm install antd @ant-design/icons axios
```

**File:** `orchestrator/frontend/src/App.tsx`

```tsx
import { Steps, Button, Card } from 'antd';
import { useState } from 'react';
import './App.css';

function App() {
  const [current, setCurrent] = useState(0);

  const steps = [
    { title: 'Welcome' },
    { title: 'System Check' },
    { title: 'Admin Setup' },
    { title: 'Select Apps' },
    { title: 'Install' }
  ];

  return (
    <div style={{ maxWidth: 800, margin: '50px auto', padding: 20 }}>
      <Card title="supOS-bedrock Setup Wizard">
        <Steps current={current} items={steps} />
        
        <div style={{ marginTop: 24, textAlign: 'center' }}>
          <h2>Welcome to supOS-bedrock</h2>
          <p>Transform industrial data integration in 5 minutes.</p>
          <Button type="primary" size="large" onClick={() => setCurrent(1)}>
            Start Setup
          </Button>
        </div>
      </Card>
    </div>
  );
}

export default App;
```

**Build:**
```bash
npm run build
# Outputs to: orchestrator/frontend/dist/
```

**Update Flask to serve:**
```python
# In orchestrator/app.py, change static_folder:
app = Flask(__name__, static_folder='frontend/dist', static_url_path='')
```

**Test:**
```bash
python3 app.py
# Visit: http://localhost:8080
# Should see Ant Design wizard
```

**Checkpoint:**
- [ ] React app loads at :8080
- [ ] Ant Design theme matches supOS
- [ ] "Start Setup" button works

---

### 1.3 Docker Compose Integration (0.5h)

**Update:** `docker-compose.yml` (orchestrator service already exists)

**Verify volumes:**
```yaml
volumes:
  - /var/run/docker.sock:/var/run/docker.sock:ro
  - ./orchestrator/config:/app/config
  - /config:/config  # Shared flag location
  - .:/workspace
```

**Build and test:**
```bash
docker compose build orchestrator
docker compose up -d orchestrator

# Test from host:
curl http://localhost:8080/api/health
```

**Checkpoint:**
- [ ] Orchestrator container starts
- [ ] Can access Flask API from host
- [ ] Docker socket mounted correctly

---

## Day 2: Setup Wizard UI (3.5h)

**Objective:** Complete React wizard with all 5 steps functional.

### 2.1 System Validation Step (1h)

**File:** `orchestrator/frontend/src/components/SystemCheck.tsx`

```tsx
import { CheckCircleOutlined, CloseCircleOutlined } from '@ant-design/icons';
import { List, Spin, Button } from 'antd';
import { useEffect, useState } from 'react';
import axios from 'axios';

interface ValidationResult {
  valid: boolean;
  issues: string[];
  warnings: string[];
}

export default function SystemCheck({ onNext }: { onNext: () => void }) {
  const [loading, setLoading] = useState(true);
  const [result, setResult] = useState<ValidationResult | null>(null);

  useEffect(() => {
    axios.post('/api/setup/validate')
      .then(res => {
        setResult(res.data);
        setLoading(false);
      })
      .catch(err => {
        console.error(err);
        setLoading(false);
      });
  }, []);

  if (loading) return <Spin size="large" />;

  const checks = [
    { name: 'Docker accessible', passed: result?.valid },
    { name: 'Disk space (20GB+)', passed: !result?.issues.some(i => i.includes('disk')) },
    { name: 'Volumes path writable', passed: !result?.issues.some(i => i.includes('VOLUMES')) }
  ];

  return (
    <div>
      <List
        dataSource={checks}
        renderItem={item => (
          <List.Item>
            {item.passed ? <CheckCircleOutlined style={{ color: 'green', marginRight: 8 }} /> : <CloseCircleOutlined style={{ color: 'red', marginRight: 8 }} />}
            {item.name}
          </List.Item>
        )}
      />
      
      {result?.valid && (
        <Button type="primary" onClick={onNext} style={{ marginTop: 24 }}>
          Continue
        </Button>
      )}
      
      {result?.issues && result.issues.length > 0 && (
        <div style={{ marginTop: 16, color: 'red' }}>
          <strong>Issues:</strong>
          <ul>
            {result.issues.map((issue, i) => <li key={i}>{issue}</li>)}
          </ul>
        </div>
      )}
    </div>
  );
}
```

**Test:** Import in App.tsx, verify checks run.

---

### 2.2 Admin Setup Step (1h)

**File:** `orchestrator/frontend/src/components/AdminForm.tsx`

```tsx
import { Form, Input, Button } from 'antd';
import { UserOutlined, MailOutlined, LockOutlined } from '@ant-design/icons';

export default function AdminForm({ onNext }: { onNext: (values: any) => void }) {
  const [form] = Form.useForm();

  const handleSubmit = (values: any) => {
    onNext(values);
  };

  return (
    <Form form={form} onFinish={handleSubmit} layout="vertical">
      <Form.Item
        label="Username"
        name="username"
        rules={[
          { required: true, message: 'Username required' },
          { min: 3, max: 20, message: '3-20 characters' }
        ]}
      >
        <Input prefix={<UserOutlined />} placeholder="admin" />
      </Form.Item>

      <Form.Item
        label="Email"
        name="email"
        rules={[
          { required: true, message: 'Email required' },
          { type: 'email', message: 'Invalid email' }
        ]}
      >
        <Input prefix={<MailOutlined />} placeholder="admin@company.com" />
      </Form.Item>

      <Form.Item
        label="Password"
        name="password"
        rules={[
          { required: true, message: 'Password required' },
          { min: 8, message: 'Minimum 8 characters' }
        ]}
      >
        <Input.Password prefix={<LockOutlined />} />
      </Form.Item>

      <Form.Item>
        <Button type="primary" htmlType="submit">
          Continue
        </Button>
      </Form.Item>
    </Form>
  );
}
```

---

### 2.3 App Selection Step (1h)

**File:** `orchestrator/frontend/src/components/AppSelector.tsx`

```tsx
import { Card, Checkbox, Button, Row, Col } from 'antd';
import { useState, useEffect } from 'react';
import axios from 'axios';

interface App {
  id: string;
  name: string;
  description: string;
  installed: boolean;
}

export default function AppSelector({ onNext }: { onNext: (apps: string[]) => void }) {
  const [apps, setApps] = useState<App[]>([]);
  const [selected, setSelected] = useState<string[]>([]);

  useEffect(() => {
    axios.get('/api/apps/list')
      .then(res => setApps(res.data))
      .catch(err => console.error(err));
  }, []);

  const handleChange = (appId: string, checked: boolean) => {
    if (checked) {
      setSelected([...selected, appId]);
    } else {
      setSelected(selected.filter(id => id !== appId));
    }
  };

  return (
    <div>
      <Row gutter={[16, 16]}>
        {apps.map(app => (
          <Col span={12} key={app.id}>
            <Card
              hoverable
              style={{ border: selected.includes(app.id) ? '2px solid #1890ff' : '1px solid #d9d9d9' }}
            >
              <Checkbox
                checked={selected.includes(app.id)}
                onChange={e => handleChange(app.id, e.target.checked)}
              >
                <strong>{app.name}</strong>
              </Checkbox>
              <p style={{ marginTop: 8, color: '#666' }}>{app.description}</p>
            </Card>
          </Col>
        ))}
      </Row>

      <Button type="primary" onClick={() => onNext(selected)} style={{ marginTop: 24 }}>
        Install Selected Apps
      </Button>
    </div>
  );
}
```

---

### 2.4 Wire All Steps in App.tsx (0.5h)

**Update:** `orchestrator/frontend/src/App.tsx`

```tsx
import { Steps, Button, Card } from 'antd';
import { useState } from 'react';
import SystemCheck from './components/SystemCheck';
import AdminForm from './components/AdminForm';
import AppSelector from './components/AppSelector';

function App() {
  const [current, setCurrent] = useState(0);
  const [adminData, setAdminData] = useState<any>(null);

  const steps = [
    { title: 'Welcome' },
    { title: 'System Check' },
    { title: 'Admin Setup' },
    { title: 'Select Apps' },
    { title: 'Install' }
  ];

  const handleAdminNext = (values: any) => {
    setAdminData(values);
    setCurrent(3);
  };

  const handleAppsNext = (apps: string[]) => {
    // Save config and start install
    setCurrent(4);
  };

  const renderStep = () => {
    switch (current) {
      case 0:
        return (
          <div style={{ textAlign: 'center' }}>
            <h2>Welcome to supOS-bedrock</h2>
            <p>Setup takes 5 minutes. No terminal needed.</p>
            <Button type="primary" size="large" onClick={() => setCurrent(1)}>
              Start Setup
            </Button>
          </div>
        );
      case 1:
        return <SystemCheck onNext={() => setCurrent(2)} />;
      case 2:
        return <AdminForm onNext={handleAdminNext} />;
      case 3:
        return <AppSelector onNext={handleAppsNext} />;
      case 4:
        return <div>Installing... (Day 3 task)</div>;
      default:
        return null;
    }
  };

  return (
    <div style={{ maxWidth: 900, margin: '50px auto', padding: 20 }}>
      <Card title="supOS-bedrock Setup">
        <Steps current={current} items={steps} style={{ marginBottom: 32 }} />
        {renderStep()}
      </Card>
    </div>
  );
}

export default App;
```

**Checkpoint:**
- [ ] All 5 steps render correctly
- [ ] Validation checks show green/red
- [ ] Admin form validates input
- [ ] App checkboxes work
- [ ] Navigation flows properly

---

## Day 3: Keycloak Integration + Docker Control (3.5h)

**Objective:** Setup wizard creates admin in Keycloak and starts containers.

### 3.1 Keycloak Admin API (2h)

**Add to orchestrator:** `orchestrator/keycloak_client.py`

```python
import requests
import os

KEYCLOAK_URL = "http://keycloak:8080"
REALM = "supos"
ADMIN_USER = os.getenv("KEYCLOAK_ADMIN", "admin")
ADMIN_PASS = os.getenv("KEYCLOAK_ADMIN_PASSWORD", "admin")


def get_admin_token():
    """Get admin access token."""
    url = f"{KEYCLOAK_URL}/realms/master/protocol/openid-connect/token"
    data = {
        "client_id": "admin-cli",
        "username": ADMIN_USER,
        "password": ADMIN_PASS,
        "grant_type": "password"
    }
    
    response = requests.post(url, data=data)
    response.raise_for_status()
    return response.json()["access_token"]


def create_user(username, email, password):
    """Create user in supOS realm."""
    token = get_admin_token()
    url = f"{KEYCLOAK_URL}/admin/realms/{REALM}/users"
    
    headers = {
        "Authorization": f"Bearer {token}",
        "Content-Type": "application/json"
    }
    
    payload = {
        "username": username,
        "email": email,
        "enabled": True,
        "credentials": [{
            "type": "password",
            "value": password,
            "temporary": False
        }],
        "groups": ["/admin"]  # Add to admin group
    }
    
    response = requests.post(url, json=payload, headers=headers)
    
    if response.status_code == 201:
        return {"success": True, "message": "User created"}
    elif response.status_code == 409:
        return {"success": False, "message": "User already exists"}
    else:
        response.raise_for_status()


def verify_user(username):
    """Check if user exists."""
    token = get_admin_token()
    url = f"{KEYCLOAK_URL}/admin/realms/{REALM}/users?username={username}"
    
    headers = {"Authorization": f"Bearer {token}"}
    response = requests.get(url, headers=headers)
    response.raise_for_status()
    
    users = response.json()
    return len(users) > 0
```

**Add endpoint to Flask:**

```python
# In orchestrator/app.py

from keycloak_client import create_user, verify_user

@app.route('/api/keycloak/create-admin', methods=['POST'])
def create_keycloak_admin():
    """Create admin user in Keycloak."""
    data = request.get_json()
    
    try:
        result = create_user(
            username=data['username'],
            email=data['email'],
            password=data['password']
        )
        return jsonify(result), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500
```

**Test:**
```bash
# Start Keycloak first
docker compose -f docker-compose-4c8g.yml up -d postgresql keycloak

# Wait 30s, then test
curl -X POST http://localhost:8080/api/keycloak/create-admin \
  -H "Content-Type: application/json" \
  -d '{"username":"testadmin","email":"test@test.com","password":"test1234"}'
```

**Checkpoint:**
- [ ] Keycloak API returns token
- [ ] User created successfully
- [ ] User visible in Keycloak UI at :8088/keycloak

---

### 3.2 Docker Compose Control (1.5h)

**Add to orchestrator:** `orchestrator/docker_manager.py`

```python
import subprocess
import os

WORKSPACE = os.getenv('SUPOS_WORKSPACE', '/workspace')


def start_services(selected_apps=None):
    """Start supOS with optional app profiles."""
    compose_file = f"{WORKSPACE}/docker-compose-4c8g.yml"
    
    command = ["docker", "compose", "-f", compose_file]
    
    # Add profiles for selected apps
    if selected_apps:
        for app in selected_apps:
            command.extend(["--profile", app])
    
    command.extend(["up", "-d"])
    
    result = subprocess.run(
        command,
        cwd=WORKSPACE,
        capture_output=True,
        text=True
    )
    
    return {
        "success": result.returncode == 0,
        "output": result.stdout,
        "error": result.stderr
    }


def get_container_status():
    """List all supOS containers."""
    result = subprocess.run(
        ["docker", "ps", "-a", "--filter", "name=supos", "--format", "{{.Names}}\t{{.Status}}"],
        capture_output=True,
        text=True
    )
    
    containers = []
    for line in result.stdout.strip().split('\n'):
        if line:
            name, status = line.split('\t')
            containers.append({"name": name, "status": status})
    
    return containers
```

**Add endpoint:**

```python
# In orchestrator/app.py

from docker_manager import start_services, get_container_status

@app.route('/api/install/start', methods=['POST'])
def start_installation():
    """Start Docker containers with selected apps."""
    data = request.get_json()
    selected_apps = data.get('apps', [])
    
    result = start_services(selected_apps)
    
    if result['success']:
        # Write setup complete flag
        with open(SETUP_FLAG, 'w') as f:
            json.dump({
                "completed_at": datetime.now().isoformat(),
                "installed_apps": selected_apps
            }, f)
        
        return jsonify({"message": "Installation started"}), 200
    else:
        return jsonify({"error": result['error']}), 500


@app.route('/api/install/status')
def installation_status():
    """Get container status."""
    containers = get_container_status()
    
    running = [c for c in containers if 'Up' in c['status']]
    
    return jsonify({
        "total": len(containers),
        "running": len(running),
        "containers": containers,
        "complete": len(running) == len(containers)
    })
```

**Test:**
```bash
curl -X POST http://localhost:8080/api/install/start \
  -H "Content-Type: application/json" \
  -d '{"apps":["grafana"]}'

# Check status
curl http://localhost:8080/api/install/status
```

**Checkpoint:**
- [ ] Docker command executes
- [ ] Containers start with profiles
- [ ] Status endpoint shows running containers
- [ ] Setup flag written

---

## Day 4: Installation Progress UI (3.5h)

**Objective:** Live streaming installation logs to React UI.

### 4.1 Server-Sent Events Endpoint (1.5h)

**Add to Flask:**

```python
# In orchestrator/app.py

from flask import Response
import time

@app.route('/api/install/stream')
def stream_installation():
    """Stream installation progress via SSE."""
    
    def generate():
        try:
            # Start installation
            yield f"data: {json.dumps({'type': 'info', 'message': 'Starting installation...'})}\n\n"
            
            # Get selected apps from config
            config = load_config()
            apps = config.get('selected_apps', [])
            
            # Start containers
            result = start_services(apps)
            
            if not result['success']:
                yield f"data: {json.dumps({'type': 'error', 'message': result['error']})}\n\n"
                return
            
            yield f"data: {json.dumps({'type': 'info', 'message': 'Containers starting...'})}\n\n"
            
            # Poll container status
            max_wait = 180  # 3 minutes
            elapsed = 0
            
            while elapsed < max_wait:
                status = get_container_status()
                running = [c for c in status if 'Up' in c['status']]
                
                yield f"data: {json.dumps({'type': 'progress', 'running': len(running), 'total': len(status)})}\n\n"
                
                if len(running) == len(status):
                    yield f"data: {json.dumps({'type': 'success', 'message': 'Installation complete!'})}\n\n"
                    
                    # Write flag
                    with open(SETUP_FLAG, 'w') as f:
                        json.dump({
                            "completed_at": datetime.now().isoformat(),
                            "installed_apps": apps
                        }, f)
                    
                    yield f"data: {json.dumps({'type': 'complete'})}\n\n"
                    break
                
                time.sleep(5)
                elapsed += 5
            
            if elapsed >= max_wait:
                yield f"data: {json.dumps({'type': 'error', 'message': 'Installation timeout'})}\n\n"
        
        except Exception as e:
            yield f"data: {json.dumps({'type': 'error', 'message': str(e)})}\n\n"
    
    return Response(generate(), mimetype='text/event-stream')
```

---

### 4.2 React Installation Component (2h)

**File:** `orchestrator/frontend/src/components/Installation.tsx`

```tsx
import { Progress, List, Alert } from 'antd';
import { useEffect, useState } from 'react';

interface LogEntry {
  type: 'info' | 'error' | 'success' | 'progress';
  message?: string;
  running?: number;
  total?: number;
}

export default function Installation() {
  const [logs, setLogs] = useState<LogEntry[]>([]);
  const [progress, setProgress] = useState(0);
  const [complete, setComplete] = useState(false);

  useEffect(() => {
    const eventSource = new EventSource('/api/install/stream');

    eventSource.onmessage = (event) => {
      const data: LogEntry = JSON.parse(event.data);
      
      if (data.type === 'progress' && data.running && data.total) {
        setProgress((data.running / data.total) * 100);
      }
      
      if (data.type === 'complete') {
        setComplete(true);
        eventSource.close();
      }
      
      setLogs(prev => [...prev, data]);
    };

    eventSource.onerror = () => {
      eventSource.close();
    };

    return () => eventSource.close();
  }, []);

  return (
    <div>
      <Progress percent={Math.round(progress)} status={complete ? 'success' : 'active'} />
      
      {complete && (
        <Alert
          message="Installation Complete!"
          description="Redirecting to supOS dashboard..."
          type="success"
          showIcon
          style={{ marginTop: 16 }}
        />
      )}
      
      <List
        style={{ marginTop: 24, maxHeight: 400, overflow: 'auto' }}
        dataSource={logs}
        renderItem={(log, index) => (
          <List.Item key={index}>
            <span style={{ color: log.type === 'error' ? 'red' : 'inherit' }}>
              {log.message || `${log.running}/${log.total} containers running`}
            </span>
          </List.Item>
        )}
      />
      
      {complete && setTimeout(() => {
        window.location.href = 'http://localhost:8088/home';
      }, 3000)}
    </div>
  );
}
```

**Update App.tsx step 4:**

```tsx
case 4:
  return <Installation />;
```

**Checkpoint:**
- [ ] Installation starts automatically
- [ ] Progress bar updates
- [ ] Logs stream in real-time
- [ ] Redirects to supOS on completion

---

## Day 5: Kong Routing + App Store API (3.5h)

**Objective:** Kong routes traffic based on setup flag. App store backend ready.

### 5.1 Kong Configuration (2h)

**File:** `mount/kong/kong.yml` (create if missing)

```yaml
_format_version: "3.0"

services:
  - name: orchestrator
    url: http://orchestrator:8080
    routes:
      - name: setup-routes
        paths:
          - /setup
          - /api/setup
          - /api/install
          - /api/keycloak
        strip_path: false

  - name: app-store
    url: http://orchestrator:8080
    routes:
      - name: app-store-api
        paths:
          - /api/apps
        strip_path: false

  - name: frontend
    url: http://frontend:80
    routes:
      - name: default
        paths:
          - /
        strip_path: false
        # This route catches everything not matched above
```

**Update docker-compose-4c8g.yml:**

```yaml
kong:
  volumes:
    - ./mount/kong/kong.yml:/usr/local/kong/declarative/kong.yml:ro
  environment:
    - KONG_DATABASE=off
    - KONG_DECLARATIVE_CONFIG=/usr/local/kong/declarative/kong.yml
```

**Test:**
```bash
docker compose -f docker-compose-4c8g.yml restart kong

# Setup routes should work
curl http://localhost:8088/api/setup/status

# After setup, should route to supOS
curl http://localhost:8088/home
```

**Checkpoint:**
- [ ] Kong loads config without errors
- [ ] Setup routes accessible via :8088
- [ ] App store API routed correctly

---

### 5.2 App Store Backend (1.5h)

**Add to Flask:**

```python
# In orchestrator/app.py

@app.route('/api/apps/install/<app_id>', methods=['POST'])
def install_app(app_id):
    """Install an optional app post-setup."""
    try:
        # Start specific profile
        result = subprocess.run(
            [
                "docker", "compose", "-f", f"{WORKSPACE}/docker-compose-4c8g.yml",
                "--profile", app_id,
                "up", "-d"
            ],
            capture_output=True,
            text=True,
            cwd=WORKSPACE
        )
        
        if result.returncode == 0:
            # Update config
            config = load_config()
            if app_id not in config['installed_apps']:
                config['installed_apps'].append(app_id)
                save_config(config)
            
            return jsonify({"message": f"{app_id} installed successfully"}), 200
        else:
            return jsonify({"error": result.stderr}), 500
    
    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route('/api/apps/uninstall/<app_id>', methods=['DELETE'])
def uninstall_app(app_id):
    """Stop and remove an app."""
    try:
        # Find container
        container_name = f"supos-{app_id}"
        
        result = subprocess.run(
            ["docker", "stop", container_name],
            capture_output=True,
            text=True
        )
        
        if result.returncode == 0:
            subprocess.run(["docker", "rm", container_name])
            
            # Update config
            config = load_config()
            if app_id in config['installed_apps']:
                config['installed_apps'].remove(app_id)
                save_config(config)
            
            return jsonify({"message": f"{app_id} uninstalled"}), 200
        else:
            return jsonify({"error": result.stderr}), 500
    
    except Exception as e:
        return jsonify({"error": str(e)}), 500
```

**Test:**
```bash
# Install Grafana
curl -X POST http://localhost:8088/api/apps/install/grafana

# Verify
docker ps | grep grafana

# Uninstall
curl -X DELETE http://localhost:8088/api/apps/uninstall/grafana
```

**Checkpoint:**
- [ ] Install endpoint starts containers
- [ ] Uninstall endpoint stops/removes
- [ ] Config persists changes

---

## Day 6: Polish + Documentation (3.5h)

**Objective:** Bug fixes, error handling, docs complete.

### 6.1 Error Handling (1.5h)

**Add to Flask:**

- Timeout handling for Keycloak calls (30s max)
- Retry logic for Docker commands (3 attempts)
- Graceful degradation if app fails to start
- Clear error messages in UI

**Add to React:**

- Network error boundaries
- Retry buttons on failures
- Toast notifications for success/error
- Loading states on all async operations

---

### 6.2 Update Documentation (1h)

**Create:** `docs/INSTALLATION.md`

```markdown
# Installation Guide

## Prerequisites
- Docker 26+ with Compose V2
- 8GB RAM minimum
- 20GB disk space
- Linux host (Ubuntu 22.04+ recommended)

## Quick Start

1. Clone repository:
   ```bash
   git clone https://github.com/YourUsername/supOS-bedrock.git
   cd supOS-bedrock
   ```

2. Start orchestrator:
   ```bash
   docker compose up -d
   ```

3. Visit setup wizard:
   ```
   http://YOUR_IP:8088
   ```

4. Follow wizard:
   - System validation
   - Create admin account
   - Select apps
   - Wait for installation (~3 minutes)

5. Access supOS dashboard:
   ```
   http://YOUR_IP:8088/home
   ```

## Post-Install

**Add more apps:**
```
http://YOUR_IP:8088/api/apps/list
```

**Manage containers:**
Use Portainer at `/portainer` or `docker compose` CLI.

**Backup:**
```bash
docker exec supos-postgresql pg_dump -U postgres > backup.sql
```
```

**Update:** `README.md` with Path C details.

---

### 6.3 Testing Checklist (1h)

**Run full flow 3 times:**

1. Fresh install on clean VM
2. Install with 2 apps selected
3. Post-install app store usage

**Document bugs:** `docs/KNOWN-ISSUES.md`

**Fix critical only.** Defer nice-to-haves.

**Checkpoint:**
- [ ] No critical bugs
- [ ] All docs updated
- [ ] README has screenshots
- [ ] Installation tested end-to-end

---

## Day 7: Demo Video + Submission (3.5h)

**Objective:** Video recorded, submission ready.

### 7.1 Video Script (0.5h)

**Outline (9 minutes):**

1. **Hook (30s):** "Industrial software is broken. Watch this."
2. **Problem (1m):** Show traditional install (scripts, SSH, configs)
3. **Solution (2m):** Setup wizard walkthrough
4. **Platform (2m):** App store demo
5. **Technical (2m):** Show architecture diagram
6. **Vision (1m):** "Nextcloud for Industrial"
7. **CTA (30s):** "Try it. Fork it. Build on it."

---

### 7.2 Record Demo (2h)

**Setup:**
- Clean Docker environment
- Screen recording tool (OBS / QuickTime)
- Test audio levels

**Recording order:**
1. Terminal: `docker compose up -d`
2. Browser: Visit localhost:8088
3. Wizard: Create admin, select Grafana
4. Show installation progress
5. Access supOS dashboard
6. Open app store, install MinIO live
7. Show Grafana working

**Pro tip:** Record in segments, edit together.

---

### 7.3 Final Polish (1h)

- Video editing (trim, add titles)
- Upload to YouTube (unlisted)
- Final README pass
- Create GitHub release: `v1.0.0-hackathon`
- Test installation on clean machine

**Checkpoint:**
- [ ] Video uploaded (<10 minutes)
- [ ] GitHub release tagged
- [ ] README has video embed
- [ ] Submission form completed

---

## Success Criteria

### Must-Ship (Minimum Viable)
- [ ] Setup wizard creates admin in Keycloak
- [ ] App selection during first-run
- [ ] At least 1 app installs successfully
- [ ] Video demonstrates vision clearly

### Should-Ship (Competitive)
- [ ] Post-install app store works
- [ ] Install/uninstall without SSH
- [ ] Professional documentation

### Nice-to-Have (Impressive)
- [ ] Update mechanism
- [ ] Backup automation
- [ ] ARM deployment validated

---

## Risk Mitigation

| Risk | Mitigation | Fallback |
|------|-----------|----------|
| Keycloak API auth fails | Use admin credentials from .env | Direct PostgreSQL insert |
| Docker socket denied | Mount `/var/run/docker.sock` | Shell script executor |
| Kong routing breaks | Debug with curl tests | Nginx alternative |
| Time overruns | Cut Day 5-6 features | Submit with Days 1-4 only |

---

## Daily Discipline

**Every session:**
1. **First 15 min:** Review yesterday's checkpoint
2. **Middle 3h:** Execute tasks
3. **Last 15 min:** Record checkpoint status

**No sunk cost fallacy.** If stuck >2 hours, pivot.

---

**Bottom line:** Path C delivers Nextcloud AIO experience in 7 days. Zero supOS modifications. Kong handles magic. User sees native experience after 5-minute setup.