#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT_DIR"

sync_theme_resources() {
  local dst_dir="$1"
  cp -f simple_swu_beamer/beamerthemesimpleswu.sty "$dst_dir"/
  cp -f simple_swu_beamer/customize.tex "$dst_dir"/
  cp -f simple_swu_beamer/sintefcolor.sty "$dst_dir"/
  mkdir -p "$dst_dir/assets"
  cp -f simple_swu_beamer/assets/swu-footer-1.pdf "$dst_dir/assets/"
  cp -f simple_swu_beamer/assets/swu-footer-2.pdf "$dst_dir/assets/"
  cp -f simple_swu_beamer/assets/swu-footer.pdf "$dst_dir/assets/"
}

echo "[1/7] Sync docs dependencies"
uv sync --only-group docs

echo "[2/7] Sync theme resources to examples"
sync_theme_resources examples/db-examples
sync_theme_resources examples/paper-ppt

echo "[3/7] Build db-examples"
pushd examples/db-examples >/dev/null
latexmk -C
latexmk -xelatex -interaction=nonstopmode -halt-on-error -file-line-error db-chapter8.tex
popd >/dev/null

echo "[4/7] Build paper-ppt"
pushd examples/paper-ppt >/dev/null
latexmk -C
latexmk -xelatex -interaction=nonstopmode -halt-on-error -file-line-error ldagcl-gemini-default.tex
latexmk -xelatex -interaction=nonstopmode -halt-on-error -file-line-error ldagcl-simpleswu.tex
latexmk -xelatex -interaction=nonstopmode -halt-on-error -file-line-error ldagcl-simpleswu-43.tex
popd >/dev/null

echo "[5/7] Collect PDFs"
mkdir -p docs/_static/pdfs
cp examples/db-examples/db-chapter8.pdf docs/_static/pdfs/db-chapter8.pdf
cp examples/paper-ppt/ldagcl-gemini-default.pdf docs/_static/pdfs/ldagcl-gemini-default.pdf
cp examples/paper-ppt/ldagcl-simpleswu.pdf docs/_static/pdfs/ldagcl-simpleswu.pdf
cp examples/paper-ppt/ldagcl-simpleswu-43.pdf docs/_static/pdfs/ldagcl-simpleswu-43.pdf

echo "[6/7] Build docs"
./run_docs.sh release

echo "[7/7] Generate PDF preview images"
uv run python docs/pdf2imgs.py

echo "All local checks passed."
