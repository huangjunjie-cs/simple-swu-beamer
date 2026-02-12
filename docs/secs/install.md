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

3. 进入示例目录：`examples/db-examples` 或 `examples/paper-ppt`。
4. 编译：

```bash
xelatex main.tex
bibtex main
xelatex main.tex
xelatex main.tex
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

若需要中文字体支持，可参考 `examples/论文汇报-ppt/assets/fonts`。
