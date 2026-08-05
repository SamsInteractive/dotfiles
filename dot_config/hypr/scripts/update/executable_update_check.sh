#!/usr/bin/env bash
set -euo pipefail

repo="$HOME/.local/share/chezmoi"
cd "$repo"

# Ensure upstream exists
upstream="$(git rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>/dev/null || true)"
if [[ -z "$upstream" ]]; then
  echo "No upstream configured for this branch."
  exit 0
fi

git fetch --quiet

behind="$(git rev-list --count "HEAD..$upstream")"
if [[ "$behind" -gt 0 ]]; then
	kitty --hold bash -lc '~/.config/hypr/scripts/update.sh'
fi
