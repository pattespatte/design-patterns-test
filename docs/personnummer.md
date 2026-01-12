---
layout: default
title: Personnummer
parent: Designmönster
status: utkast
nav_order: 150
---

**Fråga användare efter**

# Personnummer

Fråga användare efter personnummer.

## Använd mönstret när

När vi behöver ta reda på ett personnummer.

## Använd inte mönstret när

Fråga bara efter personnummer när det verkligen behövs.

## Så fungerar mönstret

Hjälp användare genom att erbjuda förlåtande formulär där användare kan mata in de vanligast förekommande varianterna av personnummer:

- ååååmmdd-nnnn
- ååmmdd-nnnn
- ååååmmddnnnn
- ååmmddnnnn
- ååååmmdd nnnn
- ååmmdd nnnn

Oavsett vilken variant användare matar in korrigeras det automatiskt till rätt format i koden med ett förlåtande formulär.

En del användare kan behöva ett exempel för hur inmatningen kan se ut. Använd små bokstäver (gemener) i exemplet, så som åååå istället för ÅÅÅÅ.

## Exempel

Visa exempel för följande:

- Förlåtande inmatning.
- Exempel för hur inmatning kan se ut.
- Användning av gemener vs. versaler.

## Referensimplementation

- Förlåtande inmatning av personnummer, källkod – Försäkringskassans designsystem: <https://github.com/Forsakringskassan/fkds-pnr>
- Gäller även samordningsnummer.

## Forskning/användartestning av mönstret

- Kapitel 7.5.4 Korrigering av misstag och fel i ISO-standarden [Kognitiv tillgänglighet – Del 1: Allmänna riktlinjer \(21801-1:2020\)](https://www.sis.se/produkter/halso-och-sjukvard/hjalpmedel-for-personer-med-funktionsnedsattning/hjalpmedel-for-personer-med-funktionsnedsattningar/ss-en-iso-21801-120212/).
