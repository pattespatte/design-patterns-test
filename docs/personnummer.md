---
layout: default
title: Personnummer
parent: Designmönster
status: utkast
nav_order: 10
---

**Fråga användare efter**

# Personnummer

Fråga användare efter personnummer

## Använd mönstret när

När vi behöver ta reda på ett personnummer.

## Använd inte mönstret när

När det inte är relevant att fråga efter personnummer. Fråga inte efter personnummer där det verkligen inte behövs.

## Så fungerar mönstret

Hjälp användare att ange ett personnummer genom att alltid använda ett förlåtande formulär där användaren kan mata in de vanligast förekommande varianterna:

- ååååmmdd-nnnn
- ååmmdd-nnnn
- ååååmmddnnnn
- ååmmddnnnn
- ååååmmdd nnnn
- ååmmdd nnnn

Oavsett vilken variant som användaren matar in så korrigeras det automatiskt till rätt format i koden.

Även med förlåtande inmatning kan en del användare behöva ett exempel för hur inmatningen kan se ut. Använd små bokstäver (gemener) i exemplet, så som åååå istället för ÅÅÅÅ.

## Exempel

Visa exempel för följande:

- Förlåtande inmatning.
- Exempel för hur inmatning kan se ut.
- Användning av gemener vs. versaler.

## Referenser

- Förlåtande inmatning av personnummer, källkod – Försäkringskassans designsystem: <https://github.com/Forsakringskassan/fkds-pnr>

## Forskning/användartestning av mönstret

- Kapitel 7.5.4 Korrigering av misstag och fel i ISO-standarden Kognitiv tillgänglighet – Del 1: Allmänna riktlinjer (21801-1:2020).
