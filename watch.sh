#!/bin/bash
WATCH_DIR="/home/quark/qw-new-site"

echo "Watching for changes..."
inotifywait -m -r -e close_write,create,delete \
  --include '.*\.(md|markdown|html|yml|css|js|png|jpg|svg)$' \
  "$WATCH_DIR/_posts" "$WATCH_DIR/_portfolio" \
  | while read -r dir event file; do
      echo "Change detected: $file — rebuilding..."
      sleep 2  # debounce in case multiple files save at once
      /home/quark/qw-new-site/publish.sh
    done
