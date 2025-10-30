#!/usr/bin/env bash
# Uso: ./scripts/new_book.sh ai-filosofia "El nombre del viento" "Patrick Rothfuss" 9786070700059 "E1·A·2" "Ficción"
set -e
col="$1"; title="$2"; author="$3"; isbn="$4"; loc="$5"; catg="$6"
id=$(cat /dev/urandom | tr -dc 'A-Z0-9' | head -c 5)
series_prefix=$(grep -A5 "slug: $col" -n "collections/$col/index.md" | grep id_prefix | awk '{print $2}')
series="${series_prefix}-$(date +%Y)-$(printf '%05d' $RANDOM)"
dir="collections/$col/books/$id"
mkdir -p "$dir"
cat > "$dir/index.md" <<EOF
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
EOF
echo "- [${title} (${id})](/collections/${col}/books/${id}/)" >> "collections/${col}/index.md"
sanitized_author=$(echo "$author" | awk '{if (NF<=1) print $1; else {$1=""; sub(/^ /,""); print}}')
sanitized_title=$(echo "$title" | iconv -f utf8 -t ascii//TRANSLIT | tr ' ' '-')
echo "NFC URI: https://biblioteca.ecolistico.com/collections/${col}/books/${id}/"
echo "NFC TEXT: ELB1|${series_prefix#ELB-}|${isbn}|${series##*-}|${sanitized_author}|${sanitized_title}"
