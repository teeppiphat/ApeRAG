INSERT INTO llm_provider (
    name, user_id, label, completion_dialect, embedding_dialect, rerank_dialect,
    allow_custom_base_url, base_url, gmt_created, gmt_updated
) VALUES (
    'gemini', 'public', 'Google Gemini', 'gemini', 'gemini', 'jina_ai',
    FALSE, 'https://generativelanguage.googleapis.com', NOW(), NOW()
)
ON CONFLICT (name) DO UPDATE SET
    user_id = EXCLUDED.user_id,
    label = EXCLUDED.label,
    completion_dialect = EXCLUDED.completion_dialect,
    embedding_dialect = EXCLUDED.embedding_dialect,
    rerank_dialect = EXCLUDED.rerank_dialect,
    allow_custom_base_url = EXCLUDED.allow_custom_base_url,
    base_url = EXCLUDED.base_url,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini-2.5-flash-native-audio-latest', 'gemini', 1048576, 1048576, 8192, '["__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini-2.5-flash-native-audio-preview-09-2025', 'gemini', 1048576, 1048576, 8192, '["__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini-2.5-flash-native-audio-preview-12-2025', 'gemini', 1048576, 1048576, 8192, '["__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini-3.1-flash-live-preview', 'gemini', 131072, 131072, 65536, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini-exp-1206', 'gemini', 2097152, 2097152, 8192, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini-flash-latest', 'gemini', 1048576, 1048576, 65535, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini-flash-lite-latest', 'gemini', 1048576, 1048576, 65535, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini-pro-latest', 'gemini', 1048576, 1048576, 65535, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/gemini-2.0-flash', 'gemini', 1048576, 1048576, 8192, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/gemini-2.0-flash-001', 'gemini', 1048576, 1048576, 8192, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/gemini-2.5-computer-use-preview-10-2025', 'gemini', 128000, 128000, 64000, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/gemini-2.5-flash', 'gemini', 1048576, 1048576, 65535, '["vision", "enable_for_collection", "enable_for_agent", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/gemini-2.5-flash-lite', 'gemini', 1048576, 1048576, 65535, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/gemini-2.5-flash-lite-preview-06-17', 'gemini', 1048576, 1048576, 65535, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/gemini-2.5-flash-lite-preview-09-2025', 'gemini', 1048576, 1048576, 65535, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/gemini-2.5-flash-native-audio-latest', 'gemini', 1048576, 1048576, 8192, '["__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/gemini-2.5-flash-native-audio-preview-09-2025', 'gemini', 1048576, 1048576, 8192, '["__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/gemini-2.5-flash-native-audio-preview-12-2025', 'gemini', 1048576, 1048576, 8192, '["__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/gemini-2.5-flash-preview-09-2025', 'gemini', 1048576, 1048576, 65535, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/gemini-2.5-pro', 'gemini', 1048576, 1048576, 65535, '["vision", "enable_for_agent", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/gemini-2.5-pro-preview-tts', 'gemini', 1048576, 1048576, 65535, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/gemini-3-flash-preview', 'gemini', 1048576, 1048576, 65535, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/gemini-3-pro-preview', 'gemini', 1048576, 1048576, 65535, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/gemini-3.1-flash-lite', 'gemini', 1048576, 1048576, 65536, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/gemini-3.1-flash-lite-preview', 'gemini', 1048576, 1048576, 65536, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/gemini-3.1-flash-live-preview', 'gemini', 131072, 131072, 65536, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/gemini-3.1-pro-preview', 'gemini', 1048576, 1048576, 65536, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/gemini-3.1-pro-preview-customtools', 'gemini', 1048576, 1048576, 65536, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/gemini-3.5-flash', 'gemini', 1048576, 1048576, 65535, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/gemini-exp-1114', 'gemini', 1048576, 1048576, 8192, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/gemini-exp-1206', 'gemini', 2097152, 2097152, 8192, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/gemini-flash-latest', 'gemini', 1048576, 1048576, 65535, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/gemini-flash-lite-latest', 'gemini', 1048576, 1048576, 65535, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/gemini-pro-latest', 'gemini', 1048576, 1048576, 65535, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/gemini-robotics-er-1.5-preview', 'gemini', 1048576, 1048576, 65535, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/gemma-3-27b-it', 'gemini', 131072, 131072, 8192, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/learnlm-1.5-pro-experimental', 'gemini', 32767, 32767, 8192, '["vision", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/lyria-3-clip-preview', 'gemini', 131072, 131072, 8192, '["__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'completion', 'gemini/lyria-3-pro-preview', 'gemini', 131072, 131072, 8192, '["__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'embedding', 'gemini/gemini-1.5-flash', 'gemini', 8192, 8192, NULL, '["enable_for_collection", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'embedding', 'gemini/gemini-embedding-001', 'gemini', 2048, 2048, NULL, '["enable_for_collection", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'embedding', 'gemini/gemini-embedding-2', 'gemini', 8192, 8192, NULL, '["enable_for_collection", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();

INSERT INTO llm_provider_models (
    provider_name, api, model, custom_llm_provider, context_window, max_input_tokens, max_output_tokens, tags,
    gmt_created, gmt_updated
) VALUES (
    'gemini', 'embedding', 'gemini/gemini-embedding-2-preview', 'gemini', 8192, 8192, NULL, '["enable_for_collection", "__autogen__"]'::jsonb,
    NOW(), NOW()
)
ON CONFLICT (provider_name, api, model) DO UPDATE SET
    custom_llm_provider = EXCLUDED.custom_llm_provider,
    context_window = EXCLUDED.context_window,
    max_input_tokens = EXCLUDED.max_input_tokens,
    max_output_tokens = EXCLUDED.max_output_tokens,
    tags = EXCLUDED.tags,
    gmt_updated = NOW();
