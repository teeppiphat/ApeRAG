# Changelog

All notable changes made in this fork (`teeppiphat/ApeRAG`) on top of upstream [`apecloud/ApeRAG`](https://github.com/apecloud/ApeRAG) are documented here. Format loosely follows [Keep a Changelog](https://keepachangelog.com/).

## 2026-07-03 — Single-machine, no-login, Thai support

This fork's stated direction going forward: single-machine deployment only (no Kubernetes/multi-tenant flexibility required), no login/registration friction, English-first UI, and first-class Thai-language document support.

### Added
- **No-login mode** (`AUTH_TYPE=none`, now the default): the app auto-provisions a single local admin user and skips sign-in/sign-up entirely. Falls back to real cookie/API-key auth first if present, so switching back to `AUTH_TYPE=cookie` restores normal auth immediately. WebSocket chat auth was updated to match.
- **Thai language support**: `th-TH` added as a collection content-language option. Elasticsearch's analyzer is now chosen per collection language at index-creation time (`th-TH` → Elasticsearch's built-in `thai` analyzer, `zh-CN` → IK, `en-US` → `english`, else `standard`) instead of hardcoding Chinese (IK) tokenization for every collection regardless of content language.
- `bge-m3` set as the default embedding model (tagged `default_for_embedding`) — chosen over `qwen3-embedding` for better cross-lingual (Thai↔English) retrieval at 4x less vector storage.

### Changed
- Frontend host port moved from `3000` to `8088` to reduce collisions with other local dev servers.
- All Docker Compose published ports bound to `127.0.0.1` instead of `0.0.0.0`, since no-login mode means anything reachable on the network would otherwise have full admin access.
- Collection content-language default changed from `zh-CN` to `en-US`.
- Landing page (`/`) now redirects straight to `/workspace/collections` instead of showing marketing content.

### Removed
- **Chinese UI language support**: the locale switcher and `zh-CN` message/doc/prompt-template files were removed; the UI is English-only. (Collections can still be configured with `zh-CN` as a *content* language — that's a different, independent setting from UI display language.)
- `README-zh.md` (superseded by this fork's English-only README).
- **Marketplace** (`/marketplace/*` routes and the publish/subscribe wiring in the collections list, header, and sidebar) — meaningless with exactly one user.
- Redundant/multi-tenant-only admin pages: `/admin/users`, `/admin/audit-logs`, `/admin/providers` (the last was a duplicate of `/workspace/providers`), and the "user default quotas" section of `/admin/configuration`.

### Fixed
- **Upload truncation**: large document uploads were silently truncated at 10MB because Next.js's `experimental.middlewareClientMaxBodySize` (which gates request bodies proxied through middleware, e.g. document uploads) wasn't configured and defaulted to 10MB — well under the backend's own 100MB limit. Now set to `100mb` to match.
- **Frontend Docker build**: `web/Dockerfile` pointed at an Aliyun-private-registry mirror of the `node` base image, unreachable outside ApeCloud's own network. Switched to the official `node:20.18.0-alpine` image.
- **Google Gemini provider**: fixed three seed-data bugs that made Gemini silently unusable end-to-end even with a valid API key — `completion_dialect`/`embedding_dialect` were `"google"`/`"openai"` (litellm has no `"google"` provider, only `"gemini"`), the tag rules used unprefixed model names that never matched litellm's actual (`gemini/`-prefixed) catalog keys so Gemini never appeared in any model picker, and zero embedding models were seeded at all (the seed generator required `max_output_tokens` to be set, which litellm never sets for embedding-mode models on *any* provider). Shipped as a new migration since the original seed migration had already run on existing databases.
- **Fulltext search returning nothing**: `search_document()`'s `minimum_should_match: "80%"` was computed across content-clauses-plus-title-clauses doubled per keyword; with 3+ extracted keywords and an empty `title` field (the common case for plain-text uploads), this structurally capped the achievable match rate below the threshold regardless of language. Restructured so each keyword contributes one should-clause (content OR title).
- The IK keyword-extraction fallback used during fulltext search now reads the index's actual configured analyzer instead of hardcoding `ik_smart`, so it stays correct for non-Chinese collections automatically.
