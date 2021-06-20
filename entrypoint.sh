#!/bin/bash
set -euo pipefail

SIGNING_PUBKEY=/tmp/signing.pub

# Load a key for signing dsc etc
gpg --import "$INPUT_SIGNING_PRIVKEY"

# Dump pubkey
gpg --export --armor "$INPUT_SIGNING_KEY_ID" > "$SIGNING_PUBKEY"

python3 -m githubaptrepos \
    --gpg-pub-key "$SIGNING_PUBKEY" \
    --github-token "$INPUT_GITHUB_TOKEN" \
    --github-repo "$GITHUB_REPOSITORY" \
    --github-download-tag "$INPUT_RELEASE_TAG" \
    --github-delete-existing
