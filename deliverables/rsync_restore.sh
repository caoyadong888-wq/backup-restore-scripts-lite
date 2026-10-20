#!/usr/bin/env bash
# Restore one snapshot onto a directory.
# Usage: rsync_restore.sh SNAPSHOT DEST
# SNAPSHOT may be a stamp directory or the "latest" symlink.
set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "usage: rsync_restore.sh SNAPSHOT DEST" >&2
  exit 2
fi

if ! command -v rsync >/dev/null 2>&1; then
  echo "rsync is not installed" >&2
  exit 3
fi

snap=$(readlink -f -- "$1")
dest=$2

if [[ ! -d $snap ]]; then
  echo "snapshot is not a directory: $snap" >&2
  exit 2
fi

mkdir -p -- "$dest"
dest=$(readlink -f -- "$dest")

if [[ $dest == "$snap" || $dest == "$snap"/* || $snap == "$dest"/* ]]; then
  echo "snapshot and destination must not contain each other" >&2
  exit 2
fi

rsync -a --delete -- "${snap}/" "${dest}/"
printf 'restored %s -> %s\n' "$snap" "$dest"
