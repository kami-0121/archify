#!/usr/bin/env bash
set -euo pipefail

TDL_REPO="https://github.com/WEDC-Studio-Official/TDL.git"
TDL_REVISION="00a67404fff39c30c8c64354567aea5c2e60f24d"
EVIDENCE_DIR=".tdl-evidence"

rm -rf "$EVIDENCE_DIR"
git clone --quiet --no-checkout "$TDL_REPO" "$EVIDENCE_DIR"
git -C "$EVIDENCE_DIR" checkout --quiet "$TDL_REVISION"

cd archify
npm ci
node bin/archify.mjs deliver \
  architecture \
  ../examples/tdl.architecture.json \
  ../docs/tdl.html \
  --quality showcase \
  --repo-root "../$EVIDENCE_DIR" \
  --json
