#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <markdown_url>" >&2
  exit 1
fi

url="$1"

if ! command -v curl >/dev/null 2>&1; then
  echo "Error: curl is required." >&2
  exit 1
fi

# Basic validation: must look like a URL and end with .md
if [[ ! "$url" =~ ^https?:// ]]; then
  echo "Error: URL must start with http:// or https://" >&2
  exit 1
fi

if [[ ! "$url" =~ \.md($|\?) ]]; then
  echo "Error: URL must point to a .md file" >&2
  exit 1
fi

out_dir="openai-docs"
mkdir -p "$out_dir"

# Derive filename from URL path (strip query string)
filename="$(basename "${url%%\?*}")"
if [[ -z "$filename" || "$filename" == "/" ]]; then
  echo "Error: Could not determine filename from URL" >&2
  exit 1
fi

out_path="$out_dir/$filename"

curl -fL "$url" -o "$out_path"

echo "Downloaded to: $out_path"
