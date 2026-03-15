# OpenProject Docker 镜像运行（外部 PostgreSQL）详细步骤

可以。OpenProject 支持通过 Docker 镜像运行，并且支持把 PostgreSQL 配置为外部数据库，只需要设置 `DATABASE_URL` 环境变量。

本文给出两种常见方式：

- 直接使用官方镜像（推荐）
- 基于当前仓库自行构建镜像

---

## 1. 前置准备

请先准备以下环境：

- Docker 24+（或兼容版本）
- Docker Compose v2（如果你选择 Compose 方式）
- 一个可访问的 PostgreSQL 实例（建议 PostgreSQL 13+）
- 已创建数据库和账号（示例：`openproject` / `op_user`）

示例连接串：

```text
postgresql://op_user:STRONG_PASSWORD@db.example.com:5432/openproject
```

> 注意：
>
> - 若密码中包含 `@`、`:`、`/` 等特殊字符，需要进行 URL 编码。
> - 如需强制 SSL，可加参数，例如 `?sslmode=require`。

---

## 2. 方式 A：直接运行官方 Docker 镜像（推荐）

### 2.1 启动容器

```bash
docker run -d \
  --name openproject \
  -p 8080:80 \
  -e SECRET_KEY_BASE=<请替换为随机长字符串> \
  -e DATABASE_URL='postgresql://op_user:STRONG_PASSWORD@db.example.com:5432/openproject?sslmode=require' \
  -v openproject_assets:/var/openproject/assets \
  openproject/openproject:17
```

参数说明：

- `SECRET_KEY_BASE`：生产环境必须设置，建议使用高强度随机值。
- `DATABASE_URL`：指向你的外部 PostgreSQL。
- `openproject_assets`：持久化附件等业务文件。

### 2.2 验证运行状态

```bash
docker logs -f openproject
```

日志中如果没有数据库连接错误，且浏览器可访问 `http://<服务器IP>:8080`，说明启动成功。

---

## 3. 方式 B：基于仓库自行构建镜像后运行

如果你希望基于当前代码仓库打包镜像，可以直接使用仓库中的生产 Dockerfile：

```bash
cd /path/to/openproject
docker build -f docker/prod/Dockerfile --target all-in-one -t my-openproject:local .
```

然后运行自建镜像，并同样传入外部数据库 URL：

```bash
docker run -d \
  --name openproject-local \
  -p 8080:80 \
  -e SECRET_KEY_BASE=<请替换为随机长字符串> \
  -e DATABASE_URL='postgresql://op_user:STRONG_PASSWORD@db.example.com:5432/openproject' \
  -v openproject_assets:/var/openproject/assets \
  my-openproject:local
```

---

## 4. 方式 C：Docker Compose 使用外部 PostgreSQL

如果你使用 Compose 部署，建议在 `docker-compose.override.yml` 中覆盖数据库配置，并去掉内置 `db` 服务依赖。示例：

```yaml
services:
  openproject:
    environment:
      DATABASE_URL: "postgresql://op_user:STRONG_PASSWORD@db.example.com:5432/openproject?sslmode=require"
      SECRET_KEY_BASE: "<请替换为随机长字符串>"
```

更新后重启：

```bash
docker compose down
docker compose up -d
```

---

## 5. 常见排查

### 5.1 容器报数据库连接失败

- 检查 PostgreSQL 白名单、防火墙和端口（默认 `5432`）。
- 在宿主机上测试连接：`psql '<DATABASE_URL>'`。
- 确认数据库编码为 UTF8。

### 5.2 容器无法访问宿主机数据库

- 在 Docker Desktop（Mac/Windows）中，可尝试把数据库地址从 `localhost` 改为 `host.docker.internal`。
- 在 Linux 的 Docker Engine 中，通常没有 `host.docker.internal`，请改用宿主机实际网卡 IP 或自定义 DNS 配置。

### 5.3 启动后页面报错或初始化未完成

- 查看日志确认迁移与种子数据是否执行完成：`docker logs -f <容器名>`。
- 确保 `SECRET_KEY_BASE` 已设置且不是默认值。

---

## 6. 小结

- OpenProject 可以打包成 Docker 镜像运行。
- 外部 PostgreSQL 通过 `DATABASE_URL` 配置即可。
- 生产场景建议使用外部数据库 + 持久化卷 + 强随机 `SECRET_KEY_BASE`。
