#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Convert PDFs to preview images for docs/README."""

from __future__ import annotations

import argparse
import time
from pathlib import Path

from pdf2image import convert_from_path

BASE_DIR = Path(__file__).resolve().parent


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Convert PDFs to image previews.")
    parser.add_argument(
        "--pdf-dir",
        type=Path,
        default=None,
        help="Input PDF directory. Auto-detected when omitted.",
    )
    parser.add_argument(
        "--img-dir",
        type=Path,
        default=None,
        help="Output image directory. Auto-detected when omitted.",
    )
    parser.add_argument(
        "--max-pages",
        type=int,
        default=None,
        help="Maximum pages to export per PDF. Default exports all pages.",
    )
    parser.add_argument(
        "--dpi",
        type=int,
        default=160,
        help="Image conversion DPI. Default: 160.",
    )
    parser.add_argument(
        "--format",
        default="jpg",
        choices=["jpg", "jpeg", "png"],
        help="Output image format. Default: jpg.",
    )
    return parser.parse_args()


def detect_dirs(pdf_dir: Path | None, img_dir: Path | None) -> tuple[Path, Path]:
    if pdf_dir and img_dir:
        return pdf_dir.resolve(), img_dir.resolve()
    if pdf_dir and not img_dir:
        return pdf_dir.resolve(), (pdf_dir.parent / "imgs").resolve()
    if not pdf_dir and img_dir:
        return (img_dir.parent / "pdfs").resolve(), img_dir.resolve()

    candidates = [
        (BASE_DIR / "_static" / "pdfs", BASE_DIR / "_static" / "imgs"),
        (BASE_DIR / "_build" / "html" / "_static" / "pdfs", BASE_DIR / "_build" / "html" / "_static" / "imgs"),
    ]
    for in_dir, out_dir in candidates:
        if in_dir.is_dir():
            return in_dir, out_dir

    checked = "\n".join(f"- {in_dir}" for in_dir, _ in candidates)
    raise SystemExit(f"PDF directory not found. Checked:\n{checked}")


def main() -> int:
    args = parse_args()
    pdf_dir, img_dir = detect_dirs(args.pdf_dir, args.img_dir)

    if not pdf_dir.is_dir():
        raise SystemExit(f"PDF directory not found: {pdf_dir}")

    img_dir.mkdir(parents=True, exist_ok=True)

    pdf_files = sorted(path for path in pdf_dir.iterdir() if path.suffix.lower() == ".pdf")
    if not pdf_files:
        print(f"[warn] No PDF files found in: {pdf_dir}")
        return 0

    start = time.time()
    total_images = 0
    output_ext = "jpg" if args.format in {"jpg", "jpeg"} else "png"
    save_format = "JPEG" if output_ext == "jpg" else "PNG"

    print(f"[info] Input PDF dir : {pdf_dir}")
    print(f"[info] Output IMG dir: {img_dir}")
    print(f"[info] PDFs found    : {len(pdf_files)}")
    print(f"[info] DPI           : {args.dpi}")
    if args.max_pages:
        print(f"[info] Max pages/PDF : {args.max_pages}")

    for pdf_path in pdf_files:
        print(f"[start] Converting: {pdf_path.name}")
        images = convert_from_path(
            str(pdf_path),
            dpi=args.dpi,
            first_page=1,
            last_page=args.max_pages if args.max_pages else None,
        )
        for i, image in enumerate(images):
            save_path = img_dir / f"{pdf_path.name}-{i}.{output_ext}"
            image.save(save_path, save_format)
            total_images += 1
            print(f"[ok] {save_path}")
        print(f"[done] {pdf_path.name}: {len(images)} page(s)")

    elapsed = time.time() - start
    print(f"[summary] Converted {len(pdf_files)} PDF(s) -> {total_images} image(s) in {elapsed:.2f}s")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
