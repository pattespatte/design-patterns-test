---
layout: default
title: Namn
parent: Designmönster
status: utkast
nav_order: 1
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

- använd ett fält med rubriken Förnamn och efternamn.

### När vi måste kunna skilja mellan för- och efternamn

Använd två separata fält med rubrikerna förnamn och efternamn för att hämta in namn i situationer:

- då det är viktigt att veta vad som är för- respektive efternamn användtvå fält.
- då man vill kunna tilltala personen på rätt sätt med förnamnet kan vara bra att veta vilket namn som är förnamn.

### När vi ber om samtliga namn

- I situationer när vi behöver samtliga namn använd två fält där det ena har rubriken förnamn och det andra efternamn.

### När vi behöver veta vad som är tilltalsnamn

- Om vi behöver få reda på tilltalsnamn använd tre fält där rubrikerna
  - Samtliga namn inklusive tilltalsnamn,
  - Tilltalsnamn
  - Efternamn

### När vi efterfrågar namn på personer annan än en själv, till exempel sitt barn, anhörig eller annan person

I det fall (Patrik E kollar upp hur de har löst det, i de fall  man ska fylla i för fler)

### Namn för kontaktuppgifter

- I många fall &ndash; t.ex. när en person kontaktar en myndighet på en fråga i ett frågeformulär och då ingen persondata ska lagras &ndash; så kräver vi intein alla namn utan det är upp till frågeställaren vilka namn denne vill delge. Använd ett fält med rubriken Namn.

### Generellt

- Att inte fråga efter sånt som vi redan vet/har
- Använda aktivt språk
- Kolla upp skärmläsare. Om du hämtar ett namn så använd inte editeringsbart fält.

### Namn

Vi diskuterade hur vi frågar efter namn och vi kan se några olika scenarion:

- Har vi namn sedan tidigare så fråga inte om det. Vi hämtar in namn i och med att personen anger personnummer (personnummer är identifierare). Refererar till Success Criterion 3.3.7 Redundant Entry (WCAG 2.2).
- I vissa fall behöver vi samtliga namn på en person. Det kan handla om att vi vill lagra personuppgifter i en databas. Exempel är när en utländsk person som inte har samordningsnummer eller personnummer i Sverige ska registreras som sökande av tillstånd att vara i Sverige. Använd två fält för namn i dessa fall: förnamn och efternamn.
- Om vi inte har tillgång till personnummer så är det troligt att vi önskar både för- och efternamn. Då kan vi ställa frågan genom ett inmatningsfält där ledtexten är ”förnamn och efternamn”.
- Användaren ska inte behöva uppge sitt namn flera gånger i en tjänst.
- Man kan ange stödtext &ndash; till ett fält som gör att det blir lättare att förstå hur vi vill få in namn t.ex. genom att skriva ”För- och efternamn”.
- Vi bör utgå från Skatteverkets namnstandard vad gäller förnamn, mellannamn och efternamn. <https://www.skatteverket.se/4.18e1b10334ebe8bc80004056.html>

### Autocomplete och personuppgifter

- GOV-UK säger att autocomplete ska användas vid fråga om namn.
- I vissa fall kan det finnas säkerhetsskäl att inte lägga in autocomplete på fält för personuppgifter. Scenariot kan vara att en person sitter på en lånad dator t.ex. på ett bibliotek och fyller i ett formulär av något slag till en myndighet. Om uppgifter då sparas för autocomplete så kan dessa exponeras när nästa person lånar datorn. Några myndigheter som är representerade i mötet uppger att de går efter den principen.
