# 安装与使用

## 最快开始（本地）

1. 安装 LaTeX（推荐 TeX Live）并确保 `xelatex` 可用。
2. 安装文档依赖（使用 `uv`）：

```bash
uv sync --only-group docs
uv run sphinx-build -b html docs docs/_build/html
```

如果你希望在文档里生成 PDF 预览图，还需要安装 poppler：

```bash
# macOS
brew install poppler
```

然后运行：

```bash
uv run python docs/pdf2imgs.py
```

3. 推荐直接跑完整本地检查（会自动同步主题资源到 `examples/*` 后再编译）：

```bash
./run_test.sh
```

4. 如果你只想单独编译某个示例，先同步资源，再编译：

```bash
cp simple_swu_beamer/beamerthemesimpleswu.sty examples/db-examples/
cp simple_swu_beamer/customize.tex examples/db-examples/
cp simple_swu_beamer/sintefcolor.sty examples/db-examples/
mkdir -p examples/db-examples/assets
cp simple_swu_beamer/assets/swu-footer*.pdf examples/db-examples/assets/

cd examples/db-examples
latexmk -xelatex -interaction=nonstopmode -halt-on-error -file-line-error db-chapter8.tex
```

## 在 Overleaf 使用

1. 新建项目并上传 `simple_swu_beamer/beamerthemesimpleswu.sty`。
2. 将示例中的 `customize.tex` 一并上传（主题默认会读取它）。
3. 在主文件中使用：

```tex
\documentclass{beamer}
\usetheme{simpleswu}
```

## 字体

若需要中文字体支持，可参考 `examples/paper-ppt/assets/fonts`。
