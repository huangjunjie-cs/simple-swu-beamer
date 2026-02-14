# 示例

目前仓库中包含两个完整示例：

- `examples/db-examples`：数据库课程风格（中文课程内容）。
- `examples/论文汇报-ppt`：学术论文汇报风格（中文科研内容）。

## 一键下载可编译示例包

- 下载：[`examples.zip`](/_static/downloads/examples.zip)
- 解压后进入 `examples/` 目录，直接执行：

```bash
xelatex main.tex
```

该压缩包已包含主题文件与字体资源（`assets/fonts/zh_CN-Adobe`）。

## 数据库课程示例（PDF）

```{raw} html
   <object
     data="/_static/pdfs/db-chapter8.pdf"
     type="application/pdf"
     width="100%"
     height="520px"
     aria-labelledby="db-examples"
   >
     <p>
       Your browser does not support PDFs.
       <a href="/_static/pdfs/db-chapter8.pdf">Download the PDF</a>
     </p>
   </object>
```

## 数据库课程示例（预览）

![db-examples-0](/_static/imgs/db-chapter8.pdf-0.jpg)
![db-examples-1](/_static/imgs/db-chapter8.pdf-1.jpg)
![db-examples-2](/_static/imgs/db-chapter8.pdf-2.jpg)
![db-examples-3](/_static/imgs/db-chapter8.pdf-3.jpg)

## 论文汇报示例（PDF）

```{raw} html
   <object
     data="/_static/pdfs/ldagcl-simpleswu.pdf"
     type="application/pdf"
     width="100%"
     height="520px"
     aria-labelledby="ldagcl"
   >
     <p>
       Your browser does not support PDFs.
       <a href="/_static/pdfs/ldagcl-simpleswu.pdf">Download the PDF</a>
     </p>
   </object>
```

## 论文汇报示例（预览）

![ldagcl-0](/_static/imgs/ldagcl-simpleswu.pdf-0.jpg)
![ldagcl-1](/_static/imgs/ldagcl-simpleswu.pdf-1.jpg)

## 生成截图

若需要将 PDF 转为图片，可用 `docs/pdf2imgs.py`（需要本地安装 poppler 或 Ghostscript）。
