#!/usr/bin/env bash
# Laster ned bildene i scripts/bilder.txt fra gamle ilgoma.no til public/bilder/.
# Hopper over filer som allerede finnes. Brukes av GitHub Actions, men kan også kjøres lokalt.
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p public/bilder
feil=0
while read -r navn sti; do
  [[ -z "${navn:-}" || "$navn" == \#* ]] && continue
  mål="public/bilder/$navn"
  [[ -s "$mål" ]] && continue
  id="${sti%%/*}"; fil="${sti#*/}"
  case "$navn" in
    sponsor-*|logo.png|vipps-qr.png) str="640x0_640x0" ;;
    *) str="1920x0_1920x0" ;;
  esac
  if curl -fsSL --retry 3 -o "$mål" "https://www.ilgoma.no/uploads/$id/$str/$fil"; then
    echo "OK   $navn"
  else
    echo "FEIL $navn"; rm -f "$mål"; feil=$((feil+1))
  fi
done < scripts/bilder.txt
echo "Ferdig. $feil feil."
