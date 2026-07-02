import fs from 'fs';
import path from 'path';

const baseDir = path.join(process.cwd(), 'src/lib/prompt-template');

export const getDefaultPrompt = async () => {
  return {
    query: String(
      fs.readFileSync(path.join(baseDir, 'query-prompt.en-US.md')),
    ),
    system: String(
      fs.readFileSync(path.join(baseDir, 'system-prompt.en-US.md')),
    ),
  };
};
