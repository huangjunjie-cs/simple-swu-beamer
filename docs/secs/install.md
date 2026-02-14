# 安装与主题使用

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

## 主题使用（最小示例）

```tex
% IMPORTANT: PLEASE USE XeLaTeX FOR TYPESETTING
\documentclass[t]{beamer}
\usetheme{simpleswu}

\title{标题}
\subtitle{副标题}
\author{作者}
\date{2026-02-14}

\begin{document}
\maketitle

\begin{frame}{Outline}
  \tableofcontents
\end{frame}

\section{第一部分}
\begin{frame}{示例页}
  \begin{itemize}
    \item 简洁要点
    \item 更多内容
  \end{itemize}
\end{frame}

\end{document}
```

## 自定义建议

- 建议在项目根目录放置 `customize.tex`，用于自定义颜色、页脚、封面图等。
- 若没有 `customize.tex`，主题会自动跳过，不影响编译。

## 在 Overleaf 使用

1. 新建项目并上传 `simple_swu_beamer/beamerthemesimpleswu.sty`。
2. 将示例中的 `customize.tex` 一并上传（主题默认会读取它）。
3. 在主文件中使用：

```tex
\documentclass{beamer}
\usetheme{simpleswu}
```

## 字体

若需要中文字体支持，可直接使用仓库中的 `simple_swu_beamer/assets/fonts/zh_CN-Adobe`。
