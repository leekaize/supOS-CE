# supOS: An Open-Source IIoT Platform

[English](README.md) | [中文](README_zh.md)

---

## Introduction
supOS is an open-source Industrial Internet of Things (IIoT) platform that integrates multiple open-source projects such as **Kong**, **Konga**, **Keycloak**, **Node-RED**, **EMQX**, **TDengine**, **TimescaleDB**, **MinIO**, **mcpclient**, and **CopilotKit**. It aims to provide a comprehensive and modular solution for building and deploying modern IIoT applications.

## Features
- **Microservices Architecture**: Uses multiple open-source services to enable a scalable, flexible platform.
- **Secure Access**: With Keycloak, ensures centralized authentication.
- **Data Processing**: Utilizes Node-RED and EMQX for IoT data ingestion and workflow orchestration.
- **Time-Series Databases**: Incorporates TDengine and TimescaleDB for storing and querying massive time-series data.
- **Storage Management**: Uses MinIO for object storage solutions.
- **API Management**: Employs Kong and Konga for API gateway and management.
- **Plugin Ecosystem**: Supports easy integration with external tools via mcpclient and CopilotKit.

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

- ENTRANCE_DOMAIN (domain or IP address for frontend)

- Any other required variables per your environment

3. **Start the project**:
 ```bash
bash bin/startup.sh
