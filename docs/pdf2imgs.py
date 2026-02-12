#!/usr/bin/env python3
#-*- coding: utf-8 -*-
"""
@author: huangjunjie
@file: pdf2imgs.py
@time: 2024/11/29
@desc: Make galleries images
"""

import os

from pdf2image import convert_from_path

BASE_DIR = os.path.dirname(os.path.abspath(__file__))

HTML_DIR = os.path.join(BASE_DIR, "_build", "html")
PDF_DIR = os.path.join(HTML_DIR, "_static", "pdfs")
IMG_DIR = os.path.join(HTML_DIR, "_static", "imgs")

if not os.path.isdir(PDF_DIR):
    raise SystemExit(f"PDF directory not found: {PDF_DIR}")

os.makedirs(IMG_DIR, exist_ok=True)

for pdf_name in os.listdir(PDF_DIR):
    if not pdf_name.endswith(".pdf"):
        continue
    pdf_path = os.path.join(PDF_DIR, pdf_name)
    images = convert_from_path(pdf_path)
    for i, image in enumerate(images):
        save_path = os.path.join(IMG_DIR, f"{pdf_name}-{i}.jpg")
        image.save(save_path, "JPEG")
