# college-swu-beamer ✨


College SWU Beamer (LaTeX) 西大简约模板 **Unofficial**



## Idea 🀄

This project is going to show some **college but elegant** beamer templates.



## Introduction 🧀

In this project, I will show some beamer templates for SWUer.


### Sintef

This template is the  secondary creations of [SINTEF Presentation template](https://www.overleaf.com/latex/templates/sintef-presentation/jhbhdffczpnx).

The example can be found [here](../gh-pages/examples/db-chapter8.pdf?raw=true)


|![](../gh-pages/galleries/db-chapter8.pdf-0.jpg) | ![](../gh-pages/galleries/db-chapter8.pdf-1.jpg) |
| :----: | :----: | 
|![](../gh-pages/galleries/db-chapter8.pdf-2.jpg) | ![](../gh-pages/galleries/db-chapter8.pdf-3.jpg) |

## Docs 📚

See `docs/` for Sphinx documentation. GitHub Pages will be built by the workflow in `.github/workflows/docs.yml`.

### Local docs workflow

- Dev mode (auto reload): `./run_docs.sh dev`
- Release mode (one-shot build): `./run_docs.sh release`
- Full local CI-style check: `./run_test.sh`
  - `run_test.sh` will copy `simple_swu_beamer/` resources (`beamerthemesimpleswu.sty`, `customize.tex`, `sintefcolor.sty`, `assets/`) into `examples/*` before compilation.

### Release bundle

- Build downloadable examples bundle: `./scripts/package_examples.sh`
- Output file: `dist/examples.zip`

## Examples 🧪

Examples live in `examples/`. Use `examples/_template` as the scaffold for new cases.
Theme source of truth is `simple_swu_beamer/beamerthemesimpleswu.sty`.



## Related Interesting Works 🎉

+ [huangjunjie-cs/simple-ucas-beamer](https://github.com/huangjunjie-cs/simple-ucas-beamer)
+ [huangjunjie-cs/simple-swu-beamer](https://github.com/huangjunjie-cs/simple-swu-beamer)
+ [liu-qilong/college-beamer](https://github.com/liu-qilong/college-beamer)


## Statement 😑

This project is **NOT** related to **ANY Official department of Southwest Univeristy**。

> [!CAUTION]
> 本项目和西南大学任何官方部门无关。
