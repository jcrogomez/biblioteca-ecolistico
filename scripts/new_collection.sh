#!/usr/bin/env bash
# Uso: ./scripts/new_collection.sh ai-filosofia "AI & Filosofía" ELB-AIF "14 días; 1 renovación"
set -e
slug="$1"; title="$2"; prefix="$3"; policy="$4"
mkdir -p "collections/$slug/books"
cat > "collections/$slug/index.md" <<EOF
---
layout: collection
slug: $slug
title: $title
description: >-
  Colección $title.
owner: "Ecolístico"
id_prefix: $prefix
loan_policy: "$policy"
---
<!-- Agrega aquí los libros de la colección -->
EOF
echo "- [${title}](/collections/${slug}/)" >> collections/index.md
echo "Colección creada: $slug"
