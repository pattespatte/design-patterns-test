---
layout: default
title: Namn
parent: Designmönster
status: utkast
nav_order: 30
---

**Fråga användare efter**

# Namn

## Använd mönstret när

Mönstret för namn kan användas både i e-tjänster och blanketter. Fråga bara efter namn när det behövs.

## Använd inte mönstret när

- Har vi namn sedan tidigare eller kan hämta in det på annat sätt så fråga vi inte om det. Förutsättningen är att vi kan visa för den som fyller i formuläret att vi har namnet.
- Användaren ska inte behöva uppge sitt namn flera gånger i en tjänst.

## Så fungerar mönstret

### När vi inte behöver samtliga namn och inte behöver kunna skilja mellan för- och efternamn

I situationer när vi vill ha för- och efternamn, men inte är beroende av att veta vilket namn som är förnamn respektive efternamn:

- använd ett fält med rubriken Förnamn och Efternamn.

### När vi måste kunna skilja mellan för- och efternamn

Använd två separata fält med rubrikerna förnamn och efternamn för att hämta in namn i situationer:

- då det är viktigt att veta vad som är för- respektive efternamn använd två fält.
- då man vill kunna tilltala personen på rätt sätt med förnamnet kan vara bra att veta vilket namn som är förnamn.

### När vi ber om samtliga namn

- I situationer när vi behöver samtliga namn använd två fält där det ena har rubriken förnamn och det andra efternamn.

### När vi behöver veta vad som är tilltalsnamn

- Om vi behöver få reda på tilltalsnamn använd tre fält där rubrikerna
  - Samtliga namn inklusive tilltalsnamn,
  - Tilltalsnamn
  - Efternamn

### När vi efterfrågar namn på personer annan än en själv, till exempel sitt barn, anhörig eller annan person

{: .kommentar}
> Patrik E kollar upp hur de har löst det, i de fall  man ska fylla i för fler

### Namn för kontaktuppgifter

- I många fall &ndash; till exempel när en person kontaktar en myndighet på en fråga i ett frågeformulär och då ingen persondata ska lagras &ndash; så kräver vi inte in alla namn utan det är upp till frågeställaren vilka namn denne vill delge. Använd ett fält med rubriken Namn.

### Autocomplete och personuppgifter

- Använd autocomplete vid fråga om namn när det inte finns någon säkerhetsrisk.
- I vissa fall kan det finnas säkerhetsskäl att inte lägga in autocomplete på fält för personuppgifter. Scenariot kan vara att en person sitter på en lånad dator t.ex. på ett bibliotek och fyller i ett formulär av något slag till en myndighet. Om uppgifter då sparas för autocomplete så kan dessa exponeras när nästa person lånar datorn. Några myndigheter som är representerade i mötet uppger att de går efter den principen.
