"""fix gemini provider seed data

The original gemini seed (migration b598e645b2ba) had three bugs that made
Gemini unusable end-to-end:

1. completion_dialect was "google", which doesn't exist in litellm's
   LlmProviders enum (only "gemini"/"vertex_ai"/"vertex_ai_beta" do) - this
   broke any code path that used the provider's dialect field as a litellm
   custom_llm_provider (e.g. LLM_KEYWORD_EXTRACTION_PROVIDER=gemini).
2. The enable_for_collection/enable_for_agent tag rules matched bare model
   names ("gemini-2.5-flash"), but litellm's actual gemini catalog keys chat
   models with a "gemini/" prefix - so the tags never applied and Gemini
   never appeared in any completion model picker in the app.
3. Zero embedding models were seeded at all, because the generator required
   max_output_tokens to be set, which litellm never sets for embedding-mode
   models (they have no output tokens) - this generator bug independently
   affects every provider's embedding models, but this migration only
   corrects Gemini's rows; the generator fix in
   models/generate_model_configs.py covers future regenerations for
   everyone else.

Revision ID: b07941b49768
Revises: a1b2c3d4e5f6
Create Date: 2026-07-03 07:00:38.000000

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa

from aperag.migration.utils import execute_sql_file


# revision identifiers, used by Alembic.
revision: str = 'b07941b49768'
down_revision: Union[str, None] = 'a1b2c3d4e5f6'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    """Re-seed the gemini provider and its models with corrected dialects, tags, and embedding rows."""
    execute_sql_file("gemini_provider_fix.sql")


def downgrade() -> None:
    """No-op: reverting to the previous (broken) gemini seed isn't useful, and other
    migrations don't reverse llm_provider/llm_provider_models seed data either."""
    pass
