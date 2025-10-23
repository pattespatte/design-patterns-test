---
layout: default
title: Personnummer
parent: Designmönster
status: utkast
nav_order: 10
---

**Fråga användare efter**

# Personnummer

![personnummer](../assets/images/exempel_personnummer.png)

## Använd mönstret när

- vi behöver ta reda på ett personnummer.

## Använd inte mönstret när

- det inte är relevant att fråga efter personnummer. Fråga inte efter personnummer där det verkligen inte behövs.

## Så fungerar mönstret

Hjälp användare att ange ett personnummer genom att alltid använda ett förlåtande formulär där användaren kan mata in de vanligast förekommande varianterna:

- ÅÅÅÅMMDD-NNNN
- ÅÅMMDD-NNNN
- ÅÅÅÅMMDDNNNN
- ÅÅMMDDNNNN
- ÅÅÅÅMMDD NNNN
- ÅÅMMDD NNNN

Oavsett vilken variant som användaren matar in så korrigeras det automatiskt till rätt format i koden.
Även med förlåtande inmatning kan en del användare behöva ett exempel för hur inmatningen kan se ut. Använd stora bokstäver (versaler) i exemplet, så som ÅÅÅÅ.
