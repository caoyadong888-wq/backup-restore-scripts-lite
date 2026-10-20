#!/usr/bin/env bash
# Incremental snapshots with rsync --link-dest.
# Usage: rsync_backup.sh SOURCE_DIR BACKUP_ROOT
# Unchanged files in the new snapshot are hard-linked to the previous one.
set -euo pipefail

usage() {
  echo "usage: rsync_backup.sh SOURCE_DIR BACKUP_ROOT" >&2
}

if [[ $# -ne 2 ]]; then
  usage
  exit 2
fi

if ! command -v rsync >/dev/null 2>&1; then
  echo "rsync is not installed" >&2
  exit 3
fi

src=$(readlink -f -- "$1")
root=$(readlink -f -- "$2")

if [[ ! -d $src ]]; then
  echo "source is not a directory: $src" >&2
  exit 2
fi

if [[ $root == "$src" || $root == "$src"/* || $src == "$root"/* ]]; then
  echo "source and backup root must not contain each other" >&2
  exit 2
fi

mkdir -p -- "$root"
stamp=$(date -u +%Y%m%dT%H%M%SZ)
dest="${root}/${stamp}"
if [[ -e $dest ]]; then
  dest="${dest}-$$"
fi
mkdir -p -- "$dest"

args=(-a --delete)
if [[ -e ${root}/latest ]]; then
  prev=$(readlink -f -- "${root}/latest")
  args+=(--link-dest "$prev")
fi

rsync "${args[@]}" -- "${src}/" "${dest}/"

ln -sfn -- "$dest" "${root}/latest.new"
mv -Tf -- "${root}/latest.new" "${root}/latest"
printf 'snapshot %s\n' "$dest"
