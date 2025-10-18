FROM python:3.12-slim

WORKDIR /app

# Install Docker CLI and Docker Compose
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl gettext xz-utils git

RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-28.5.1.tgz && \
    tar xzvf docker-28.5.1.tgz --strip 1 -C /usr/local/bin docker/docker && \
    rm docker-28.5.1.tgz

RUN mkdir -p $HOME/.docker/cli-plugins && \
    curl -fsSL https://github.com/docker/compose/releases/download/v2.40.0/docker-compose-linux-x86_64 -o $HOME/.docker/cli-plugins/docker-compose && \
    chmod +x $HOME/.docker/cli-plugins/docker-compose

# Copy requirements first for better caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY app.py .
COPY setup_wizard.py .
COPY templates/ templates/

# Create config directory
RUN mkdir -p /app/config

EXPOSE 8080

CMD ["python", "app.py"]