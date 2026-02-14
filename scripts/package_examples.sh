#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIST_DIR="$ROOT_DIR/dist"
PKG_ROOT="$DIST_DIR/simple-swu-beamer-examples"
ZIP_PATH="$DIST_DIR/examples.zip"

rm -rf "$PKG_ROOT"
mkdir -p "$PKG_ROOT/assets/fonts/zh_CN-Adobe" "$PKG_ROOT/images"

# Core theme files
cp "$ROOT_DIR/simple_swu_beamer/beamerthemesimpleswu.sty" "$PKG_ROOT/beamerthemesimpleswu.sty"
cp "$ROOT_DIR/simple_swu_beamer/sintefcolor.sty" "$PKG_ROOT/sintefcolor.sty"
cp "$ROOT_DIR/simple_swu_beamer/customize.tex" "$PKG_ROOT/customize.tex"

# Theme images required by beamerthemesimpleswu.sty
cp "$ROOT_DIR/examples/db-examples/images/SINTEF_Logo_Sentrert_RGB.jpg" "$PKG_ROOT/images/"
cp "$ROOT_DIR/examples/db-examples/images/SINTEF_Logo_Sentrert_Negativ_RGB.jpg" "$PKG_ROOT/images/"

# Fonts used by the theme (preferred over system fonts)
cp "$ROOT_DIR/examples/paper-ppt/assets/fonts/zh_CN-Adobe/"*.otf "$PKG_ROOT/assets/fonts/zh_CN-Adobe/"

# Minimal starter tex
cp "$ROOT_DIR/examples/_template/main.tex" "$PKG_ROOT/main.tex"

cat > "$PKG_ROOT/README.md" <<'EOF'
# simple-swu-beamer examples bundle

Contents:

- `main.tex`: starter file
- `beamerthemesimpleswu.sty`: theme file
- `sintefcolor.sty`, `customize.tex`: theme dependencies
- `images/`: theme logo assets
- `assets/fonts/zh_CN-Adobe/`: bundled Chinese fonts

Build:

```bash
xelatex main.tex
```
EOF

mkdir -p "$DIST_DIR"
rm -f "$ZIP_PATH"
(
  cd "$DIST_DIR"
  zip -r "examples.zip" "simple-swu-beamer-examples" >/dev/null
)

echo "Created: $ZIP_PATH"
