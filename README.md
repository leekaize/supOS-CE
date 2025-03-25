# supOS: An Open-Source IIoT Platform

[English](README.md) | [中文](README_zh.md)

---

## Introduction
supOS is an open-source Industrial Internet of Things (IIoT) platform that integrates multiple open-source projects such as **Kong**, **Konga**, **Keycloak**, **Node-RED**, **EMQX**, **TDengine**, **TimescaleDB**, **MinIO**, **mcpclient**, and **CopilotKit**. It aims to provide a comprehensive and modular solution for building and deploying modern IIoT applications.

# Platform Architecture

## Microservices Architecture
Integrates various containers (e.g., backend, frontend, EMQX, Node-RED, etc.) to form a scalable and modular IIoT platform.

## API Management with Kong & Konga

- **Kong**: Provides a high-performance, extensible, open-source API gateway.
- **Konga**: A user-friendly UI for managing Kong configurations, monitoring services, and handling plugins.

## Edge & IoT Data Handling

- **EMQX**: MQTT broker for real-time data streaming and message management.
- **Node-RED**: Low-code flow-based development tool for wiring IoT devices, APIs, and services.

## Database & Time-Series Management

- **PostgreSQL (TimescaleDB plugin)**: A time-series optimized database for industrial data.
- **TDengine**: A specialized time-series database offering efficient data ingestion, processing, and queries.
- **Chat2DB**: Provides an AI-assisted SQL interface for easier database exploration and querying.

## Observability & Logging

- **Elasticsearch & Filebeat**: Centralizes and indexes logs for real-time searching and analysis.
- **Kibana**: Visualizes and analyzes data ingested into Elasticsearch, offering dashboards and logs for troubleshooting.

## SCADA-Like Interfaces

- **FUXA**: A flow-based and visual SCADA-like environment for controlling and monitoring industrial systems.

## Analytics & Dashboarding

- **Grafana**: Creates customized, real-time dashboards and data visualizations.

## Single Sign-On (SSO) & Security

- **Keycloak**: Centralized identity and access management, providing SSO, user federation, and more.

## Object Storage

- **MinIO**: High-performance, S3-compatible object storage solution with OpenID integration.

## GraphQL Integration

- **Hasura**: Offers instant, real-time GraphQL APIs on top of PostgreSQL/TimescaleDB for modern application development.



---

## Installation

### 1. Linux

#### 1.1 Operating Environment
- **Operating System**: Currently tested on Ubuntu Server 24.04 with Docker. We welcome feedback on other OS distributions.
- **Docker**: We assume you have Docker (with `docker compose` and `buildx`) installed. Our tested versions:
  - Docker Engine - Community: 27.4.0
  - Docker Buildx: v0.19.2
  - Docker Compose: v2.31.0
  - containerd: 1.7.24

If you don’t have Docker installed yet, our scripts can help set it up for Ubuntu Server 24.04. For other operating systems, please refer to the official Docker documentation.

### 2. Usage
1. **Clone the project**:
   ```bash
   git clone <this repo>
   
2. **Edit environment variables in the .env file**:
- VOLUMES_PATH (directory for storing project data)
  
- ENTRANCE_DOMAIN( Do not use 127.0.0.1)
  
- Any other required variables per your environment

3. **Start the project**:
 ```bash
bash bin/startup.sh
```
- Wait for containers to pull and initialize. This may take a few minutes on first run.

4. **Access to the Platform**:

Visit http://<YOUR-DOMAIN>:<YOUR-PORT> in your browser (based on ENTRANCE_DOMAIN and ENTRANCE_PORT in .env).

5.**License**: 

This project is distributed under [LICENSE_NAME]. See LICENSE for details.


6. **Contact**: 

If you have questions, open an issue or email us.


