#!/usr/bin/env bash
# Uso: ./scripts/new_book.sh ai-filosofia "El nombre del viento" "Patrick Rothfuss" 9786070700059 "E1·A·2" "Ficción"
set -euo pipefail

if [ "$#" -ne 6 ]; then
  echo "Uso: $0 <collection_slug> <title> <author> <isbn13> <location> <category>" >&2
  exit 1
fi

col="$1"
title="$2"
author="$3"
isbn="$4"
loc="$5"
catg="$6"

if [[ ! "$col" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
  echo "Error: collection_slug inválido." >&2
  exit 1
fi

collection_index="collections/$col/index.md"
if [[ ! -f "$collection_index" ]]; then
  echo "Error: no existe la colección '$col'." >&2
  exit 1
fi

if [[ ! "$isbn" =~ ^[0-9Xx-]{10,17}$ ]]; then
  echo "Error: ISBN inválido (solo dígitos, X y guiones)." >&2
  exit 1
fi

if [[ -z "$title" || -z "$author" || -z "$loc" || -z "$catg" ]]; then
  echo "Error: title, author, location y category son obligatorios." >&2
  exit 1
fi

id=$(tr -dc 'A-Z0-9' </dev/urandom | head -c 5)
series_prefix=$(awk -F': ' '/^id_prefix:/{print $2; exit}' "$collection_index")
if [[ -z "$series_prefix" ]]; then
  echo "Error: id_prefix no encontrado en $collection_index" >&2
  exit 1
fi

series="${series_prefix}-$(date +%Y)-$(printf '%05d' "$RANDOM")"
dir="collections/$col/books/$id"
mkdir -p "$dir"
cat > "$dir/index.md" <<EOF_INNER
---
layout: book
collection: $col
id: $id
title: $title
author: $author
isbn13: "$isbn"
series: $series
location: "$loc"
category: "$catg"
language: "es"
status: "Disponible"
acquired_at: "$(date +%F)"
collection_role: >
  (Añade aquí el porqué vive en esta colección)
---
(Descripción del libro)
EOF_INNER

echo "- [${title} (${id})](/collections/${col}/books/${id}/)" >> "$collection_index"
sanitized_author=$(echo "$author" | awk '{if (NF<=1) print $1; else {$1=""; sub(/^ /,""); print}}' | tr -d '\n\r|')
sanitized_title=$(echo "$title" | iconv -f utf8 -t ascii//TRANSLIT | tr ' ' '-' | tr -d '\n\r|')

echo "NFC URI: https://biblioteca.ecolistico.com/collections/${col}/books/${id}/"
echo "NFC TEXT: ELB1|${series_prefix#ELB-}|${isbn}|${series##*-}|${sanitized_author}|${sanitized_title}"
