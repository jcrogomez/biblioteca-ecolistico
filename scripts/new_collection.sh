#!/usr/bin/env bash
# Uso: ./scripts/new_collection.sh ai-filosofia "AI & Filosofía" ELB-AIF "14 días; 1 renovación"
set -euo pipefail

if [ "$#" -ne 4 ]; then
  echo "Uso: $0 <slug> <title> <prefix> <policy>" >&2
  exit 1
fi

slug="$1"
title="$2"
prefix="$3"
policy="$4"

if [[ ! "$slug" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
  echo "Error: slug inválido. Usa minúsculas, números y guiones medios." >&2
  exit 1
fi

if [[ "$prefix" =~ [[:space:]] ]] || [[ -z "$prefix" ]]; then
  echo "Error: id_prefix inválido. No debe contener espacios." >&2
  exit 1
fi

if [[ -e "collections/$slug" ]]; then
  echo "Error: la colección '$slug' ya existe." >&2
  exit 1
fi

if [[ -z "$title" || -z "$policy" ]]; then
  echo "Error: title y policy no pueden estar vacíos." >&2
  exit 1
fi

mkdir -p "collections/$slug/books"
cat > "collections/$slug/index.md" <<EOF_INNER
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
EOF_INNER

echo "- [${title}](/collections/${slug}/)" >> collections/index.md
echo "Colección creada: $slug"
