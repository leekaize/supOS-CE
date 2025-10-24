#!/usr/bin/env python3
"""supOS-bedrock Orchestrator - Production"""

import os
import json
import time
import subprocess
import docker
from datetime import datetime
from flask import Flask, jsonify, request, send_from_directory
from flask_cors import CORS

app = Flask(__name__, static_folder='static', static_url_path='')
CORS(app)

# Paths
CONFIG_FILE = '/app/config/config.json'
SETUP_FLAG = '/config/setup_complete'
WORKSPACE = os.getenv('SUPOS_WORKSPACE', '/workspace')

client = docker.from_env()

def load_config():
    if os.path.exists(CONFIG_FILE):
        with open(CONFIG_FILE, 'r') as f:
            return json.load(f)
    return {
        "setup_complete": False,
        "admin": {},
        "network": {"domain": os.getenv("ENTRANCE_DOMAIN", "127.0.0.1"), "port": int(os.getenv("ENTRANCE_PORT", 8088))},
        "system": {"volumes_path": os.getenv("VOLUMES_PATH", "/volumes/supos/data")},
        "selected_apps": [],
        "installed_apps": []
    }

def save_config(config):
    os.makedirs(os.path.dirname(CONFIG_FILE), exist_ok=True)
    with open(CONFIG_FILE, 'w') as f:
        json.dump(config, f, indent=2)

def is_setup_complete():
    return os.path.exists(SETUP_FLAG)

def write_setup_flag(config):
    os.makedirs(os.path.dirname(SETUP_FLAG), exist_ok=True)
    with open(SETUP_FLAG, 'w') as f:
        json.dump({
            "completed_at": datetime.utcnow().isoformat() + "Z",
            "admin_username": config.get("admin", {}).get("username", "admin"),
            "installed_apps": config.get("installed_apps", [])
        }, f, indent=2)

@app.route('/')
def index():
    if is_setup_complete():
        return jsonify({"message": "Setup complete"}), 200
    return send_from_directory('static', 'index.html')

@app.route('/<path:path>')
def catch_all(path):
    if os.path.exists(os.path.join('static', path)):
        return send_from_directory('static', path)
    return send_from_directory('static', 'index.html')

@app.route('/api/health')
def health():
    try:
        containers = client.containers.list()
        return jsonify({"status": "ok", "setup_complete": is_setup_complete(), "containers": len(containers)})
    except:
        return jsonify({"status": "ok", "setup_complete": is_setup_complete(), "containers": 0})

@app.route('/api/setup/status')
def setup_status():
    if is_setup_complete():
        try:
            with open(SETUP_FLAG, 'r') as f:
                return jsonify({**json.load(f), "completed": True})
        except:
            return jsonify({"completed": True})
    return jsonify({"completed": False})

@app.route('/api/setup/validate', methods=['POST'])
def validate_setup():
    try:
        issues = []
        warnings = []
        
        try:
            client.ping()
        except:
            issues.append("Docker socket unavailable")
        
        volumes_path = os.getenv("VOLUMES_PATH", "/volumes/supos/data")
        if not os.path.exists(volumes_path):
            issues.append(f"Volumes path missing: {volumes_path}")
        
        return jsonify({"valid": len(issues) == 0, "issues": issues, "warnings": warnings})
    except Exception as e:
        return jsonify({"valid": False, "issues": [str(e)], "warnings": []}), 500

@app.route('/api/config/volumes-path')
def get_volumes_path():
    try:
        path = os.getenv("VOLUMES_PATH", "/volumes/supos/data")
        return jsonify({"path": path, "mounted": os.path.exists(path)})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route('/api/config/update', methods=['POST'])
def update_config():
    try:
        data = request.get_json()
        env_file = os.path.join(WORKSPACE, '.env')
        
        if os.path.exists(env_file):
            with open(env_file, 'r') as f:
                lines = f.readlines()
        else:
            lines = []
        
        updates = {
            'ENTRANCE_DOMAIN': data.get('ip_address'),
            'VOLUMES_PATH': data.get('volumes_path'),
            'OS_RESOURCE_SPEC': data.get('resource_spec', '1')
        }
        
        for key, value in updates.items():
            if value is None:
                continue
            found = False
            for i, line in enumerate(lines):
                if line.startswith(f'{key}='):
                    lines[i] = f'{key}={value}\n'
                    found = True
                    break
            if not found:
                lines.append(f'{key}={value}\n')
        
        with open(env_file, 'w') as f:
            f.writelines(lines)
        
        return jsonify({"success": True})
    except Exception as e:
        return jsonify({"success": False, "error": str(e)}), 500

@app.route('/api/install/start', methods=['POST'])
def start_installation():
    logs = []
    try:
        data = request.get_json(force=True)
        selected_apps = data.get('selected_apps', [])
        admin_data = data.get('admin', {})
        network_data = data.get('network', {})
        
        logs.append(f"Starting installation: apps={selected_apps}")
        
        # Write to .env
        logs.append("Updating configuration...")
        env_file = os.path.join(WORKSPACE, '.env')
        
        env_vars = {}
        if os.path.exists(env_file):
            with open(env_file, 'r') as f:
                for line in f:
                    line = line.strip()
                    if line and not line.startswith('#') and '=' in line:
                        key, value = line.split('=', 1)
                        env_vars[key] = value
        
        # Update with orchestrator data
        updates = {
            'ENTRANCE_DOMAIN': network_data.get('domain', env_vars.get('ENTRANCE_DOMAIN', '127.0.0.1')),
            'ENTRANCE_PORT': str(network_data.get('port', env_vars.get('ENTRANCE_PORT', '8088'))),
            'SELECTED_PROFILES': ','.join(selected_apps)
        }
        
        env_vars.update(updates)
        
        with open(env_file, 'w') as f:
            for key, value in env_vars.items():
                f.write(f'{key}={value}\n')
        
        logs.append("✓ Configuration saved")
        
        # Run install.sh in non-interactive mode
        logs.append("Running installation script...")
        install_script = os.path.join(WORKSPACE, 'bin/install.sh')
        
        result = subprocess.run(
            ['/bin/bash', install_script, '--non-interactive'],
            cwd=WORKSPACE,
            capture_output=True,
            text=True,
            timeout=600,
            env=os.environ.copy()
        )
        
        # Capture output
        if result.stdout:
            for line in result.stdout.split('\n'):
                if line.strip():
                    logs.append(line)
        
        if result.returncode != 0:
            error_msg = result.stderr or "Installation failed"
            return jsonify({"success": False, "error": error_msg, "logs": logs}), 500
        
        logs.append("✓ Installation complete")
        
        # Save state
        config = load_config()
        config['installed_apps'] = selected_apps
        config['admin'] = admin_data
        config['network'] = network_data
        save_config(config)
        write_setup_flag(config)
        
        return jsonify({"success": True, "message": "Installation complete", "logs": logs})
        
    except subprocess.TimeoutExpired:
        return jsonify({"success": False, "error": "Installation timeout (10 min)", "logs": logs}), 500
    except Exception as e:
        import traceback
        return jsonify({"success": False, "error": str(e), "trace": traceback.format_exc(), "logs": logs}), 500

@app.route('/api/install/status')
def installation_status():
    try:
        containers = client.containers.list(all=True)
        return jsonify({"containers": [{"name": c.name, "status": c.status} for c in containers]})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route('/api/apps/list')
def list_apps():
    apps = [
        {"id": "grafana", "name": "Grafana", "description": "Visualization", "icon": "📊"},
        {"id": "minio", "name": "MinIO", "description": "Object storage", "icon": "🗄️"},
        {"id": "portainer", "name": "Portainer", "description": "Container mgmt", "icon": "🐳"},
        {"id": "chat2db", "name": "Chat2DB", "description": "DB client", "icon": "💬"}
    ]
    config = load_config()
    installed = set(config.get('installed_apps', []))
    for app in apps:
        app['installed'] = app['id'] in installed
    return jsonify({"apps": apps})

@app.route('/api/setup/reset', methods=['POST'])
def reset_setup():
    try:
        if os.path.exists(SETUP_FLAG):
            os.remove(SETUP_FLAG)
        config = load_config()
        config['setup_complete'] = False
        save_config(config)
        return jsonify({"success": True})
    except Exception as e:
        return jsonify({"success": False, "error": str(e)}), 500

@app.route('/api/setup/complete', methods=['POST'])
def complete_setup():
    try:
        data = request.get_json()
        config = load_config()
        config['admin'] = data.get('admin', {})
        config['selected_apps'] = data.get('selected_apps', [])
        config['setup_complete'] = True
        save_config(config)
        return jsonify({"success": True})
    except Exception as e:
        return jsonify({"success": False, "error": str(e)}), 500

if __name__ == '__main__':
    os.makedirs(os.path.dirname(CONFIG_FILE), exist_ok=True)
    port = int(os.getenv('ORCHESTRATOR_PORT', 8080))
    app.run(host='0.0.0.0', port=port, debug=True)