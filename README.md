# ApeRAG Solo

![HarryPotterKG2.png](docs%2Fen-US%2Fimages%2FHarryPotterKG2.png)

![chat2.png](docs%2Fen-US%2Fimages%2Fchat2.png)

ApeRAG is a RAG (Retrieval-Augmented Generation) platform that combines Graph RAG, vector search, and full-text search with AI agents. Build hybrid-retrieval AI applications with multimodal document processing, intelligent agents, and a knowledge graph over your own documents.

**ApeRAG Solo** (`teeppiphat/ApeRAG`) is a fork customized for **single-machine, single-user deployment** — no login/registration required, English-only UI, and built-in Thai-language document/embedding support. See [CHANGELOG.md](./CHANGELOG.md) for the full list of changes from upstream [`apecloud/ApeRAG`](https://github.com/apecloud/ApeRAG).

> **คำอธิบายโครงการ (ภาษาไทย)**
>
> ApeRAG Solo คือ [ApeRAG](https://github.com/apecloud/ApeRAG) เวอร์ชันที่ปรับแต่งให้เหมาะกับการใช้งาน **คนเดียวในเครื่องเดียว** — ไม่ต้องล็อกอินหรือลงทะเบียนก่อนใช้งาน ระบบสร้างผู้ใช้ admin ให้อัตโนมัติ พร้อมรองรับการค้นหาและสร้าง embedding ภาษาไทยควบคู่กับภาษาอังกฤษ (เลือก analyzer และโมเดลให้เหมาะกับภาษาของเอกสารแต่ละชุด) เหมาะสำหรับใครที่อยากมีระบบ RAG ของตัวเองรันบนเครื่อง Mac/Linux/Windows โดยไม่ต้องพึ่งพา cloud หรือดูแลระบบผู้ใช้หลายคนแบบองค์กร ดูรายละเอียดการเปลี่ยนแปลงทั้งหมดจากต้นทางได้ที่ [CHANGELOG.md](./CHANGELOG.md)

- [Quick Start](#quick-start)
- [Key Features](#key-features)
- [Configuration](#configuration)
- [Development](./docs/en-US/development/development-guide.md)
- [Build Docker Image](./docs/en-US/deployment/build-docker-image.md)
- [Kubernetes Deployment](#kubernetes-deployment)
- [Acknowledgments](#acknowledgments)
- [License](#license)

## Quick Start

> Minimum system requirements:
>
> - CPU >= 2 Core
> - RAM >= 4 GiB (16 GiB+ recommended if also running local LLMs via Ollama)
> - Docker & Docker Compose (or [Podman](https://podman.io/) + `podman-compose`, which is what this fork is developed against on macOS)

```bash
git clone https://github.com/teeppiphat/ApeRAG.git
cd ApeRAG
cp envs/env.template .env
docker-compose up -d --pull always
# or, with Podman:
# podman-compose -f docker-compose.yml up -d
```

Once the containers are healthy, open **http://localhost:8088** — you're taken straight into the app with no sign-in step. The API and its docs are at http://localhost:8000/docs.

All published ports are bound to `127.0.0.1` by default (see [Configuration](#configuration)), since there's no login to gate access.

#### Using a local LLM (Ollama)

This fork was built around a local [Ollama](https://ollama.com/) instance running natively on the host rather than a containerized one. From inside the containers, the host is reachable at `http://host.docker.internal:11434`. After starting Ollama and pulling a model, add it as an LLM provider from **Settings → Models** in the UI, using that base URL plus `/v1`.

#### MCP (Model Context Protocol) Support

ApeRAG exposes an [MCP](https://modelcontextprotocol.io/) server at `http://localhost:8000/mcp/` (streamable HTTP transport, stateless — no session setup required) with 5 tools: `list_collections`, `search_collection` (hybrid vector/full-text/graph/summary/vision search), `search_chat_files`, `web_search`, and `web_read`.

Generate an API key from **Settings → API Keys** in the UI (or `GET /api/v1/apikeys`). Every client below needs it as a `Bearer` token — **keep the trailing slash on the URL** (`/mcp/`, not `/mcp`); without it the server 307-redirects, and some clients don't forward the `Authorization` header through that redirect.

<details>
<summary><strong>Claude Code</strong></summary>

Add to `.mcp.json` (project) or `~/.claude.json` (user-wide):

```json
{
  "mcpServers": {
    "aperag": {
      "type": "http",
      "url": "http://localhost:8000/mcp/",
      "headers": {
        "Authorization": "Bearer your-api-key-here"
      }
    }
  }
}
```

Or via the CLI:

```bash
claude mcp add --transport http aperag http://localhost:8000/mcp/ \
  --header "Authorization: Bearer your-api-key-here"
```

</details>

<details>
<summary><strong>Claude Desktop</strong></summary>

Claude Desktop's `claude_desktop_config.json` only loads local stdio servers directly from JSON — it can't call a remote HTTP endpoint with a custom header on its own. Bridge it with [`mcp-remote`](https://www.npmjs.com/package/mcp-remote) (requires Node.js):

```json
{
  "mcpServers": {
    "aperag": {
      "command": "npx",
      "args": [
        "-y", "mcp-remote", "http://localhost:8000/mcp/",
        "--header", "Authorization:${APERAG_AUTH_HEADER}"
      ],
      "env": {
        "APERAG_AUTH_HEADER": "Bearer your-api-key-here"
      }
    }
  }
}
```

Use the `env` var + no-space `Authorization:${...}` form above rather than a literal `"Authorization: Bearer ..."` string — Claude Desktop has a known bug on some platforms where spaces inside `args` aren't escaped correctly, which silently breaks the header.

Edit via Claude menu → Settings → Developer → Edit Config, then fully quit and reopen Claude Desktop.

</details>

<details>
<summary><strong>Codex CLI</strong></summary>

Add to `~/.codex/config.toml`. Prefer pulling the key from an environment variable rather than committing it to the file:

```toml
[mcp_servers.aperag]
url = "http://localhost:8000/mcp/"
bearer_token_env_var = "APERAG_API_KEY"
```

```bash
export APERAG_API_KEY=your-api-key-here
```

</details>

<details>
<summary><strong>OpenCode</strong></summary>

Add to `opencode.json`. Note the top-level key is `mcp`, not `mcpServers`, and `type` must be set explicitly:

```json
{
  "$schema": "https://opencode.ai/config.json",
  "mcp": {
    "aperag": {
      "type": "remote",
      "url": "http://localhost:8000/mcp/",
      "enabled": true,
      "headers": {
        "Authorization": "Bearer your-api-key-here"
      }
    }
  }
}
```

</details>

**Sanity-check the server directly** before debugging a client, since it isolates whether the problem is ApeRAG or the client config:

```bash
curl http://localhost:8000/mcp/ \
  -H "Authorization: Bearer your-api-key-here" \
  -H "Content-Type: application/json" \
  -H "Accept: application/json, text/event-stream" \
  -d '{"jsonrpc":"2.0","id":1,"method":"tools/list","params":{}}'
```

A working server returns an `event: message` / `data: {...}` block listing the 5 tools. If you get HTTP 406, you're missing the `Accept` header above — most real MCP clients set it for you, curl doesn't.

#### Enhanced Document Parsing

For complex documents, tables, and formulas, ApeRAG can use [MinerU](https://github.com/opendatalab/MinerU) via the optional `doc-ray` service:

```bash
DOCRAY_HOST=http://aperag-docray:8639 docker compose --profile docray up -d
# or with GPU acceleration:
DOCRAY_HOST=http://aperag-docray-gpu:8639 docker compose --profile docray-gpu up -d
```

`doc-ray` is CPU/GPU-intensive — if you're running it alongside other workloads on the same machine, keep an eye on resource contention.

#### Development & Contributing

See the [Development Guide](./docs/en-US/development/development-guide.md) for source setup, testing, and contribution instructions.

## Key Features

**1. Advanced Index Types**: Five index types — **Vector**, **Full-text**, **Graph**, **Summary**, and **Vision** — for multi-dimensional document understanding and retrieval.

**2. Intelligent AI Agents**: Built-in agents with MCP tool support that identify relevant collections, search intelligently, and can fall back to web search.

**3. Enhanced Graph RAG**: A modified [LightRAG](https://github.com/HKUDS/LightRAG) implementation with entity normalization for cleaner knowledge graphs.

**4. Multimodal Processing & Vision Support**: Document parsing including vision analysis of images, charts, and visual content alongside text.

**5. Hybrid Retrieval Engine**: Combines Graph RAG, vector search, full-text search, summary-based retrieval, and vision-based search.

**6. Multilingual by design**: English and Thai are both first-class for embeddings and full-text search — Elasticsearch's analyzer is chosen per collection language (Thai gets Lucene's built-in `thai` analyzer, not a CJK-oriented one), and `bge-m3` is the default embedding model for good cross-lingual (Thai↔English) retrieval.

**7. MinerU Integration**: Optional advanced document parsing for complex documents, tables, formulas, and scientific content, with optional GPU acceleration.

**8. No-Login Single-User Mode**: `AUTH_TYPE=none` (the default in this fork) skips sign-in/sign-up entirely and auto-provisions a local admin account — appropriate for a single person running this on their own machine. Set `AUTH_TYPE=cookie` to restore normal username/password auth.

**9. Developer Friendly**: FastAPI backend, Next.js frontend, async task processing with Celery, and an agent development framework.

## Configuration

Key settings in `.env` (copied from `envs/env.template`):

| Variable | Default (this fork) | Notes |
|---|---|---|
| `AUTH_TYPE` | `none` | `none` = no login, single auto-provisioned admin user. `cookie` = normal username/password auth. |
| `REGISTER_MODE` | `unlimited` | Only relevant when `AUTH_TYPE=cookie`. |

Docker Compose port bindings (`docker-compose.yml`) are all scoped to `127.0.0.1` — if you need LAN/remote access, change the bindings deliberately and make sure you understand the access-control implications of `AUTH_TYPE=none` first.

## Kubernetes Deployment

This fork is optimized for single-machine use, so Kubernetes isn't the primary path here — but the upstream Helm chart under `deploy/aperag/` and the KubeBlocks database scripts under `deploy/databases/` are still present and functional if you need multi-node deployment. See upstream [`apecloud/ApeRAG`'s README](https://github.com/apecloud/ApeRAG#kubernetes-deployment-recommended-for-production) for the full walkthrough.

## Acknowledgments

ApeRAG integrates and builds upon several excellent open-source projects:

### LightRAG
The graph-based knowledge retrieval capabilities in ApeRAG are powered by a deeply modified version of [LightRAG](https://github.com/HKUDS/LightRAG):
- **Paper**: "LightRAG: Simple and Fast Retrieval-Augmented Generation" ([arXiv:2410.05779](https://arxiv.org/abs/2410.05779))
- **Authors**: Zirui Guo, Lianghao Xia, Yanhua Yu, Tu Ao, Chao Huang
- **License**: MIT License

See the [LightRAG modifications changelog](./aperag/graph/lightrag/CHANGELOG.md) for details, and this fork's own [CHANGELOG.md](./CHANGELOG.md) for changes made on top of upstream ApeRAG.

## License

ApeRAG is licensed under the Apache License 2.0. See the [LICENSE](./LICENSE) file for details.
