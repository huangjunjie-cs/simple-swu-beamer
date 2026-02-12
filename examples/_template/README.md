# 示例模板

这个目录用于创建新的示例。

建议结构：

- `main.tex`：主文件
- `refs.bib`：参考文献（可选）
- `images/`：图片素材
- `assets/`：字体或其他资源

编译：

```bash
xelatex main.tex
bibtex main
xelatex main.tex
xelatex main.tex
```

