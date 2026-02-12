# 主题使用

## 最小示例

```tex
% IMPORTANT: PLEASE USE XeLaTeX FOR TYPESETTING
\documentclass[t]{beamer}
\usetheme{simpleswu}

\title{标题}
\subtitle{副标题}
\author{作者}
\date{2025-12-15}

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

