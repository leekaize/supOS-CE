FROM node:20-alpine AS frontend-builder

WORKDIR /build

# Copy frontend source
COPY frontend/package*.json ./
RUN npm install

COPY frontend/ ./
RUN npm run build
# Output: /build/dist/

# ==================== PYTHON STAGE ====================
FROM python:3.12-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    gettext \
    xz-utils \
    git \
    gcc \
    python3-dev && \
    rm -rf /var/lib/apt/lists/*

# Install Docker CLI (detect architecture)
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "aarch64" ]; then DOCKER_ARCH="aarch64"; else DOCKER_ARCH="x86_64"; fi && \
    curl -fsSLO https://download.docker.com/linux/static/stable/${DOCKER_ARCH}/docker-28.5.1.tgz && \
    tar xzvf docker-28.5.1.tgz --strip 1 -C /usr/local/bin docker/docker && \
    rm docker-28.5.1.tgz

# Install Docker Compose
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "aarch64" ]; then COMPOSE_ARCH="aarch64"; else COMPOSE_ARCH="x86_64"; fi && \
    mkdir -p $HOME/.docker/cli-plugins && \
    curl -fsSL https://github.com/docker/compose/releases/download/v2.40.0/docker-compose-linux-${COMPOSE_ARCH} -o $HOME/.docker/cli-plugins/docker-compose && \
    chmod +x $HOME/.docker/cli-plugins/docker-compose

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy Flask app
COPY app.py .

# Copy built React app from frontend-builder stage
COPY --from=frontend-builder /build/dist/ /app/static/

# Create config directory
RUN mkdir -p /app/config

EXPOSE 8080

# Production server
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "--workers", "2", "--timeout", "600", "--log-level", "debug", "--access-logfile", "-", "--error-logfile", "-", "app:app"]