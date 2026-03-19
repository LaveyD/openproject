# 在 Ubuntu 22.04 上部署 OpenProject（无 Docker）

本指南介绍如何使用官方 Debian 包在 Ubuntu 22.04 (Jammy) 上安装 OpenProject，无需容器化部署。

## 1. 环境要求

- **操作系统**：Ubuntu Server 22.04 (x86_64)
- **硬件配置（最低）**：4 vCPU / 4 GB 内存 / 20 GB 磁盘空间（适用于约 200 用户）。更大规模需相应增加配置。
- **网络**：需要出站 HTTPS 连接以下载软件包，入站 HTTP/HTTPS 供用户访问。
- **数据库**：PostgreSQL 16+（推荐 17）。新的主要版本需要 PostgreSQL 17；迁移详情请参阅 `./installation-and-operations/misc/migration-to-postgresql17/`。需要 UTF8 编码。
- **SSL**：可选但推荐（安装程序支持 Let's Encrypt）。

## 2. 准备系统

```bash
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates wget
```

## 3. 添加 OpenProject APT 仓库（stable 17）

```bash
# 导入签名密钥
sudo curl -fsSL https://packages.openproject.com/srv/deb/opf/openproject/gpg-key.gpg \
  -o /usr/share/keyrings/openproject.gpg

# 添加 Ubuntu 22.04 的仓库列表
sudo curl -fsSL \
  https://packages.openproject.com/srv/opf/openproject/stable/17/installer/ubuntu/22.04.list \
  -o /etc/apt/sources.list.d/openproject.list

sudo apt-get update
```

## 4. 安装 OpenProject 软件包

```bash
sudo apt-get install -y openproject
```

此命令会创建 `openproject` 系统用户、systemd 服务，以及 `/var/lib/openproject` 下的目录结构。

## 5. 运行配置向导

```bash
sudo openproject reconfigure   # 交互式配置（推荐）
# sudo openproject configure   # 如果配置已保存，可使用非交互式
```

向导选项包括：

- **版本选择**（标准版/BIM 版）
- **数据库**：创建本地 PostgreSQL 或连接外部数据库。外部数据库需准备 `主机/端口/数据库名/用户名/密码`。
- **Web 服务器与 SSL**：自动配置 Apache2 和可选的 Let's Encrypt；如使用自己的代理可跳过。
- **缓存**：memcached
- **主机名/协议**
- **管理员邮箱与 SMTP 设置**

## 6. 外部 PostgreSQL 配置参考

如果使用外部数据库，请先创建数据库：

```sql
CREATE DATABASE openproject ENCODING 'UTF8' LC_COLLATE 'C' LC_CTYPE 'C';
CREATE USER op_user WITH PASSWORD '强密码';
ALTER DATABASE openproject OWNER TO op_user;
```

连接 URL 示例：

```
postgresql://op_user:强密码@db.example.com:5432/openproject
```

OpenProject 要求 UTF8 编码；`C` 区域设置满足此要求。不兼容的编码会导致启动失败。

## 7. 服务管理

- **Web/API**：systemd 服务 `openproject`
- **后台任务**：由同一软件包管理（GoodJob/PostgreSQL）
- **日志**：`journalctl -u openproject`
- **资源/上传文件**：`/var/lib/openproject`（需持久化和备份）

## 8. 升级

```bash
sudo apt-get update
sudo apt-get install openproject
sudo openproject configure
```

跨主要版本升级时，请确保仓库 URL 与目标主要版本匹配（例如 `stable/17`）。

## 9. 备份要点

- **数据库**：使用 `pg_dump` 或 `pg_basebackup`
- **文件数据**：`/var/lib/openproject`（附件、仓库）
- 主要版本升级前请保留备份副本

## 10. 故障排查快速检查

- 服务状态：`systemctl status openproject`
- 最近日志：`journalctl -u openproject -n 200`
- 数据库连接测试：`psql <DATABASE_URL>`
- 编码/ICU 错误：使用 UTF8 + ICU 兼容区域设置重新创建数据库

## 11. 实用链接

- 安装与运维指南：`./installation-and-operations/`
- 系统要求：`./installation-and-operations/system-requirements/`
- PostgreSQL 17 迁移说明：`./installation-and-operations/misc/migration-to-postgresql17/`

---

## 12. 在 WSL (Ubuntu) 上进行本地开发 — PostgreSQL 已安装

本节介绍在 WSL 2 (Ubuntu 22.04) 中以**开发模式**运行 OpenProject，前提是 PostgreSQL 已在主机/WSL 实例中可用。

> **注意**：这仅是开发环境配置，不适用于生产环境。
> 推荐硬件配置：4 vCPU / 8 GB 内存（首选 16 GB）。

### 12.1 安装系统依赖

```bash
sudo apt-get update
sudo apt-get install -y git curl build-essential zlib1g-dev libyaml-dev \
  libssl-dev libpq-dev libreadline-dev
```

### 12.2 通过 rbenv 安装 Ruby 3.4.7

```bash
# 安装 rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init - bash)"' >> ~/.bashrc
source ~/.bashrc

# 安装 ruby-build 插件
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# 安装 Ruby（版本需与 .ruby-version 文件匹配）
rbenv install 3.4.7
rbenv global 3.4.7
rbenv rehash
```

### 12.3 通过 nodenv 安装 Node.js 22

```bash
# 安装 nodenv
git clone https://github.com/nodenv/nodenv.git ~/.nodenv
echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(nodenv init -)"' >> ~/.bashrc
source ~/.bashrc

# 安装 node-build 插件
git clone https://github.com/nodenv/node-build.git $(nodenv root)/plugins/node-build

# 安装 Node.js（版本需与项目要求匹配）
nodenv install 22.21.0
nodenv global 22.21.0
nodenv rehash

# 更新 npm
npm install npm@latest -g
```

### 12.4 准备 PostgreSQL 数据库

假设 PostgreSQL 已在运行。创建开发和测试数据库：

```bash
sudo -u postgres psql <<'SQL'
CREATE USER openproject WITH PASSWORD 'openproject-dev-password' CREATEDB;
CREATE DATABASE openproject_dev  ENCODING 'UTF8' OWNER openproject;
CREATE DATABASE openproject_test ENCODING 'UTF8' OWNER openproject;
SQL
```

> 如果 PostgreSQL 使用自定义端口或 socket 路径，请在下面的 `config/database.yml` 中调整 `host` / `port`。

### 12.5 克隆仓库并配置

```bash
mkdir -p ~/dev && cd ~/dev
git clone https://github.com/LaveyD/openproject.git
cd openproject
```

创建 `config/database.yml`：

```yaml
default: &default
  adapter: postgresql
  encoding: unicode
  host: localhost
  username: openproject
  password: openproject-dev-password

development:
  <<: *default
  database: openproject_dev

test:
  <<: *default
  database: openproject_test
```

复制并可选编辑环境文件：

```bash
cp .env.example .env
```

### 12.6 安装依赖并初始化数据库

```bash
# 安装 gems、node 模块、链接插件模块、导出语言文件
bin/setup_dev

# 初始化开发数据库
RAILS_ENV=development bin/rails db:seed
```

### 12.7 启动应用

最简单的方式是通过 `bin/dev`（使用 **overmind** 或 **foreman**，如果可用的话）：

```bash
# 安装 overmind（推荐的进程管理器）
# 从 https://github.com/DarthSim/overmind/releases 下载 Linux 二进制文件
# 例如：
curl -Lo /usr/local/bin/overmind.gz \
  https://github.com/DarthSim/overmind/releases/latest/download/overmind-v2.5.1-linux-amd64.gz
gunzip /usr/local/bin/overmind.gz && chmod +x /usr/local/bin/overmind

# 然后启动所有进程
bin/dev
```

或者，在不同终端中单独启动各进程：

```bash
# 终端 1 — Rails Web 服务器
RAILS_ENV=development bin/rails server

# 终端 2 — 前端（Angular 开发服务器，支持热重载）
RAILS_ENV=development npm run serve

# 终端 3 — 后台任务工作进程
RAILS_ENV=development bundle exec good_job start
```

### 12.8 访问应用

| URL | 描述 |
|-----|------|
| `http://localhost:3000` | Rails 服务器（完整应用） |
| `http://localhost:4200` | 前端开发服务器（热重载） |

默认管理员凭据：**用户名** `admin` / **密码** `admin`

### 12.9 常见 WSL 技巧

- **PostgreSQL 无法启动**：在 WSL 2 中，systemd 可能未启用。手动启动 PostgreSQL：`sudo service postgresql start`
- **端口已被占用**：使用 `ss -tlnp | grep 3000` 检查并终止冲突进程
- **文件监视缓慢**：将仓库放在 WSL 文件系统（`~/`）而非挂载的 Windows 驱动器（`/mnt/c/`）中，可获得更好的性能
- **日志文件**：位于项目根目录的 `log/development.log`