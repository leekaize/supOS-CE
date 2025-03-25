
---

## `README_zh.md` (Chinese)

```md
# supOS: 开源工业物联网平台

[English](README.md) | [中文](README_zh.md)

---

## 简介
supOS 是一个开源的工业物联网 (IIoT) 平台，集成了 **Kong**、**Konga**、**Keycloak**、**Node-RED**、**EMQX**、**TDengine**、**TimescaleDB**、**MinIO**、**mcpclient** 以及 **CopilotKit** 等多种开源项目，旨在为构建和部署现代工业物联网应用提供一个全面、模块化的解决方案。

## 功能特性
- **微服务架构**：使用多个开源服务，构建可扩展、灵活的IIoT平台。
- **安全访问**：利用 Keycloak 实现集中式身份认证管理。
- **数据处理**：通过 Node-RED 和 EMQX 实现物联网数据采集和流程编排。
- **时序数据库**：采用 TDengine 和 TimescaleDB 存储并查询海量时序数据。
- **存储管理**：使用 MinIO 提供对象存储解决方案。
- **API 管理**：使用 Kong 和 Konga 进行 API 网关和管理。
- **插件生态**：通过 mcpclient 和 CopilotKit 实现对外部工具的轻松集成。

---

## 安装说明

### 1. Linux

#### 1.1 运行环境
- **操作系统**：目前我们只在 Ubuntu Server 24.04 的 Docker 环境下进行过测试。欢迎反馈其它操作系统上的使用体验。
- **Docker**：假设您已经安装了包含 `docker compose` 和 `buildx` 插件的 Docker。我们测试过的版本如下：
  - Docker Engine - Community: 27.4.0
  - Docker Buildx: v0.19.2
  - Docker Compose: v2.31.0
  - containerd: 1.7.24

如果您尚未安装 Docker 环境，我们的脚本可以帮助您在 Ubuntu Server 24.04 上完成安装。对于其他操作系统，请参阅 Docker 官方文档。

### 2. 使用方法
1. **克隆项目**：
   ```bash
   git clone <this repo>

2. **.env 文件中的环境变量**：

- VOLUMES_PATH（项目数据存放目录）

- ENTRANCE_DOMAIN（前端入口域名或 IP 地址）

- 以及其它根据您环境所需的变量

3. 启动项目：

```bash
bash bin/startup.sh
