---
layout: default
title: Telefonnummer
parent: Designmönster
nav_order: 2
---

**Fråga användare efter**

# Telefonnummer

## Använd mönstret när

Beskrivning.

## Använd inte mönstret när

Beskrivning.

## Så fungerar mönstret

Vi diskuterade hur vi frågar efter telefonnummer.

### Valideringsregler

- Tecken som bör vara tillåtna är +, - och mellanslag.
- När landskod behövs – så rekommenderar vi att lägga ett eget fält för detsom är en droplista eller liknande där världens länder finns som val.
- Om systemet vet var vi är så är det bra om vi kan erbjuda landskoden.
- Förklara varför vi behöver ett visst nummer. [Kommentar 2025-04-07 – kan bli problem när man har det på detta sätt – i de fall autocomplete fyller i det jag skrev tidigare med landsnummer först då får man landskod två gånger. GOV-UK – visar upp de alternativ som systemet tolkar om det blir flera och så får användaren - välja vilket som är rätt. DE skriver välj den x som är rätt.]
- Vår rekommendation är att visa upp telefonnumret omformaterat i den form vi lagrar numret i. Det ger användaren en bild av vad vi lagrar – så att denne kan bedöma om vi uppfattat telefonnumret rätt.
- GOV-UK säger om telefonnummer:
  - samla inte in om det inte behövs,
  - tillåt olika format och tecken,oanvänd autocomplete,
  - gör tydligt vilken typ av nummer man behöv – t.ex. mobilnummer, nummer med landskod,
  - ge exempel som visar vilken typ av nummer vi vill ha uppgift om,
  - förklara varför man behöver nummer – [ta med det i vårt mönster],
  - lägg inte telefonnummer som länk om det inte går att ringa med den typ av teknisk enhet (dator, platta, mobil) som användaren använder – kan dock vara svårt att avgöra vilken typ av enhet användaren använder,
  - undvik omformatering av telefonnummer när det presenteras efter inmatning av användaren – en del användare kan bli förvirrade av ändringen.
  - [Github](https://github.com/alphagov/govuk-design-system-backlog/issues/101)
