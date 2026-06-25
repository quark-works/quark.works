#!/bin/bash
set -e

SITE_DIR="/home/quark/qw-new-site"
OUTPUT_DIR="/home/quark/quark.works"

echo "Building Jekyll..."
cd "$SITE_DIR"
bundle exec jekyll build --destination "$OUTPUT_DIR"

echo "Committing and pushing..."
cd "$OUTPUT_DIR"
git add -A
git commit -m "Auto-publish: $(date '+%Y-%m-%d %H:%M:%S')"
git push

echo "Done!"
