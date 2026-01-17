#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <md_input_dir> <pdf_output_dir>" >&2
  exit 1
fi

in_dir="$1"
out_dir="$2"

if [[ ! -d "$in_dir" ]]; then
  echo "Error: input directory does not exist: $in_dir" >&2
  exit 1
fi

if ! command -v pandoc >/dev/null 2>&1; then
  echo "Error: pandoc is required." >&2
  exit 1
fi

if ! command -v prince >/dev/null 2>&1; then
  echo "Error: prince is required for PDF generation." >&2
  exit 1
fi

mkdir -p "$out_dir"

shopt -s nullglob

for md_file in "$in_dir"/*.md; do
  base_name="$(basename "${md_file%.md}")"
  pdf_path="$out_dir/$base_name.pdf"
  pandoc "$md_file" --pdf-engine=prince -o "$pdf_path"
  echo "Converted: $md_file -> $pdf_path"
done
