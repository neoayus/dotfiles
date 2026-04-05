#!/usr/bin/env bash

NOTES_DIR="$HOME/notes/daily-notes"
TODAY=$(date +%F)
FILE="$NOTES_DIR/$TODAY.md"

mkdir -p "$NOTES_DIR"

if [ ! -f "$FILE" ]; then
    echo "# Notes $TODAY" > "$FILE"
fi

nvim "+normal G" "$FILE"
