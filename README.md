# Nettsiden til IL Goma

Ny nettside for [ilgoma.no](https://www.ilgoma.no), laget med [Astro](https://astro.build).

## Redigere innhold (for styret)

Gå til **https://app.pagescms.org**, logg inn med GitHub og velg **ilgoma-nettside**. Der kan du skrive nyheter, endre priser, treningstider, styret, sponsorer og tekstene på sidene. Når du trykker **Save**, oppdateres nettsiden automatisk etter et par minutter.

Tekst merket «MÅ FYLLES INN» vises med gul bakgrunn på siden til den er fylt inn.

## Hvor ligger hva

| Innhold | Fil |
|---|---|
| Nyheter og aktivitetsrapporter | `src/content/nyheter/` |
| Tekster på sidene (inkl. leieavtale og info om lokalet) | `src/content/sider/` |
| Priser og info for Gomahuset | `src/data/utleie.json` |
| Medlemspriser | `src/data/medlemskap.json` |
| Treningstider | `src/data/trening.json` |
| Styre, trenere, kontaktinfo | `src/data/klubb.json` |
| Sponsorer | `src/data/sponsorer.json` |
| Bilder | `public/bilder/` |

## For utviklere

```
npm install
npm run dev     # lokal forhåndsvisning
npm run build   # bygger til dist/
```

Bildene fra den gamle siden lastes ned av GitHub Actions (`.github/workflows/hent-bilder.yml`) fra listen i `scripts/bilder.txt`.
