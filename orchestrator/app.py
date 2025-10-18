import docker
from flask import Flask, render_template, jsonify, request, redirect, url_for, Response
import os
import subprocess
import setup_wizard

app = Flask(__name__)
client = docker.from_env()

SUPOS_WORKSPACE = os.getenv('SUPOS_WORKSPACE', '/workspace')


# ==================== STARTUP ====================

def initialize_environment():
    """Generate .env on startup if configured."""
    if not setup_wizard.is_first_run():
        config = setup_wizard.load_config()
        success, message = setup_wizard.generate_env_file(
            config,
            template_path='/app/templates/.env.template',
            output_path=f'{SUPOS_WORKSPACE}/.env'
        )
        if success:
            print(f"✓ {message}")
        else:
            print(f"⚠ {message}")

initialize_environment()


# ==================== MIDDLEWARE ====================

@app.before_request
def check_first_run():
    """Redirect to setup if not configured."""
    if setup_wizard.is_first_run():
        if request.path.startswith('/setup') or request.path.startswith('/api/setup'):
            return None
        return redirect(url_for('setup_page'))


# ==================== SETUP ====================

@app.route("/setup")
def setup_page():
    """First-run wizard."""
    if not setup_wizard.is_first_run():
        return redirect(url_for('dashboard'))
    return render_template("setup.html")


@app.route("/api/setup/validate", methods=["POST"])
def validate_setup():
    """System requirements check."""
    try:
        valid, issues, warnings = setup_wizard.validate_system_requirements()
        return jsonify({"valid": valid, "issues": issues, "warnings": warnings}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route("/api/setup/complete", methods=["POST"])
def complete_setup():
    """Save configuration."""
    try:
        data = request.get_json()
        config = setup_wizard.load_config()
        
        # Admin user
        admin_data = data.get('admin', {})
        config['admin'] = setup_wizard.create_admin_user(
            username=admin_data.get('username'),
            email=admin_data.get('email'),
            password=admin_data.get('password')
        )
        
        # Network
        network_data = data.get('network', {})
        config['network']['domain'] = network_data.get('domain')
        config['network']['port'] = network_data.get('port')
        config['localization']['language'] = data.get('language', 'en-US')
        
        # Service passwords
        passwords = setup_wizard.generate_service_passwords()
        config['services']['postgres']['password'] = passwords['postgres']
        config['services']['keycloak']['admin_password'] = passwords['keycloak_admin']
        config['services']['emqx']['admin_password'] = passwords['emqx_admin']
        config['services']['minio']['secret_key'] = passwords['minio_secret']
        config['services']['kong']['db_password'] = passwords['kong_db']
        
        # Validate volumes path
        valid, message = setup_wizard.validate_volumes_path(config['system']['volumes_path'])
        if not valid:
            return jsonify({"error": f"Path error: {message}"}), 400
        
        setup_wizard.complete_setup(config)
        
        # Generate .env in workspace root
        success, msg = setup_wizard.generate_env_file(
            config,
            template_path='/services/.env.template',
            output_path=f'{SUPOS_WORKSPACE}/.env'
        )
        if not success:
            print(f"⚠ {msg}")
        
        return jsonify({"message": "Setup complete"}), 200
        
    except ValueError as e:
        return jsonify({"error": str(e)}), 400
    except Exception as e:
        return jsonify({"error": str(e)}), 500


# ==================== DASHBOARD ====================

@app.route("/")
def dashboard():
    """Main UI."""
    return render_template("dashboard.html")


# ==================== SUPOS-CE ====================

@app.route("/api/supos/status")
def supos_status():
    """Check supOS-CE state."""
    install_script = f"{SUPOS_WORKSPACE}/bin/install.sh"
    
    if not os.path.exists(install_script):
        return jsonify({
            "installed": False,
            "configured": False,
            "message": "supOS-CE scripts not found"
        }), 200
    
    # Check installation completion flag
    config = setup_wizard.load_config()
    installation_complete = config.get("installation_complete", False)
    
    # Count containers
    try:
        all_containers = []
        for name in ["frontend", "backend", "keycloak", "postgresql", "emqx", "tsdb", "nodered", "kong"]:
            all_containers.extend(client.containers.list(all=True, filters={"name": name}))
        
        running = [c for c in all_containers if c.status == "running"]
        
        return jsonify({
            "installed": True,
            "configured": installation_complete,
            "running": len(running) > 0,
            "container_count": len(all_containers),
            "running_count": len(running)
        }), 200
    except Exception as e:
        return jsonify({
            "installed": True,
            "configured": False,
            "running": False,
            "error": str(e)
        }), 200


@app.route("/api/supos/install", methods=["GET"])
def install_supos():
    """Install supOS-CE using bin/install.sh."""
    
    def generate():
        try:
            install_script = f"{SUPOS_WORKSPACE}/bin/install.sh"
            
            if not os.path.exists(install_script):
                yield f'data: {{"type": "error", "message": "Install script not found"}}\n\n'
                return
            
            yield f'data: {{"type": "info", "message": "Starting installation..."}}\n\n'
            
            # Load config for environment variables
            config = setup_wizard.load_config()
            
            # Environment to bypass ALL interactive prompts
            env = os.environ.copy()
            env.update({
                # Network config (answers IP selection prompt)
                'ENTRANCE_DOMAIN': config['network']['domain'],
                'ENTRANCE_PORT': str(config['network']['port']),
                'ENTRANCE_PROTOCOL': config['network']['protocol'],
                
                # System config
                'VOLUMES_PATH': config['system']['volumes_path'],
                'OS_PLATFORM_TYPE': config['system']['platform_type'],
                'OS_RESOURCE_SPEC': '1' if config['system']['resource_spec'] == '4c8g' else '2',
                
                # Localization
                'LANGUAGE': config['localization']['language'],
                
                # Skip all prompts
                'AUTO_INSTALL': 'true',
                'SKIP_PROMPTS': 'true',
                
                # Default to base profile (no optional services)
                # User can add profile selection to wizard later
                'SERVICE_PROFILE': 'base',
            })
            
            yield f'data: {{"type": "info", "message": "Calling bin/install.sh..."}}\n\n'
            
            # Prepare stdin answers for interactive prompts
            # Each line answers one prompt in order
            stdin_answers = "\n".join([
                "0",      # ENTRANCE_DOMAIN: option 0 (keep current/use env var)
                "",       # Any other prompts: accept default (empty = Enter)
                "",
                "",
            ]) + "\n"
            
            # Run install script with auto-answers
            process = subprocess.Popen(
                ["bash", "bin/install.sh"],
                cwd=SUPOS_WORKSPACE,
                stdin=subprocess.PIPE,
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                text=True,
                bufsize=1,
                universal_newlines=True,
                env=env
            )
            
            # Send answers immediately
            process.stdin.write(stdin_answers)
            process.stdin.close()
            
            for line in iter(process.stdout.readline, ''):
                if line:
                    clean = line.strip().replace('"', '\\"').replace('\n', '')
                    yield f'data: {{"type": "log", "message": "{clean}"}}\n\n'
            
            process.wait()
            
            if process.returncode == 0:
                config['installation_complete'] = True
                setup_wizard.save_config(config)
                
                yield f'data: {{"type": "success", "message": "Installation complete"}}\n\n'
                yield f'data: {{"type": "complete"}}\n\n'
            else:
                yield f'data: {{"type": "error", "message": "Failed code {process.returncode}"}}\n\n'
                
        except Exception as e:
            yield f'data: {{"type": "error", "message": "{str(e)}"}}\n\n'
    
    return Response(generate(), mimetype='text/event-stream')


@app.route("/api/supos/start", methods=["POST"])
def start_supos():
    """Start services using bin/start.sh."""
    try:
        result = subprocess.run(
            ["bash", "bin/start.sh"],
            cwd=SUPOS_WORKSPACE,
            capture_output=True,
            text=True,
            timeout=30
        )
        
        return jsonify({
            "message": "Started" if result.returncode == 0 else "Failed",
            "output": result.stdout or result.stderr
        }), 200 if result.returncode == 0 else 500
            
    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route("/api/supos/stop", methods=["POST"])
def stop_supos():
    """Stop services using bin/stop.sh."""
    try:
        result = subprocess.run(
            ["bash", "bin/stop.sh"],
            cwd=SUPOS_WORKSPACE,
            capture_output=True,
            text=True,
            timeout=30
        )
        
        return jsonify({
            "message": "Stopped" if result.returncode == 0 else "Failed",
            "output": result.stdout or result.stderr
        }), 200 if result.returncode == 0 else 500
            
    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route("/api/supos/restart", methods=["POST"])
def restart_supos():
    """Restart services (stop + start)."""
    try:
        subprocess.run(["bash", "bin/stop.sh"], cwd=SUPOS_WORKSPACE, timeout=30)
        result = subprocess.run(
            ["bash", "bin/start.sh"],
            cwd=SUPOS_WORKSPACE,
            capture_output=True,
            text=True,
            timeout=30
        )
        
        return jsonify({
            "message": "Restarted" if result.returncode == 0 else "Failed",
            "output": result.stdout or result.stderr
        }), 200 if result.returncode == 0 else 500
            
    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route("/api/supos/cleanup", methods=["POST"])
def cleanup_supos():
    """Clean using bin/clean-all.sh."""
    try:
        result = subprocess.run(
            ["bash", "bin/clean-all.sh", "-f"],
            cwd=SUPOS_WORKSPACE,
            capture_output=True,
            text=True,
            timeout=60
        )
        
        # Reset installation flag
        config = setup_wizard.load_config()
        config['installation_complete'] = False
        setup_wizard.save_config(config)
        
        return jsonify({
            "message": "Cleaned" if result.returncode == 0 else "Failed",
            "output": result.stdout or result.stderr
        }), 200 if result.returncode == 0 else 500
            
    except Exception as e:
        return jsonify({"error": str(e)}), 500


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080, debug=False)