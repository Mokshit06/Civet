#!/bin/bash
set -euo pipefail

rm -r dist/ || true
mkdir -p dist

# normal files
coffee build/esbuild.coffee

# cli
BIN="dist/civet"
echo "#!/usr/bin/env node" | cat - dist/cli.js > "$BIN"
chmod +x "$BIN"
rm dist/cli.js

# esbuild-plugin
./dist/civet < esbuild-plugin.civet > esbuild-plugin.js

# types
cp types/types.d.ts dist/types.d.ts
