---
layout: default
title: QR-kod
parent: Designmönster
status: utkast
nav_order: 60
---

**Fråga användare efter**

# QR-kod

## Använd mönstret när

- Användaren ska logga in med Mobilt BankID på en annan enhet, till exempel en dator. Det är obligatoriskt med QR-kod vid inloggning med Mobilt BankID på en annan enhet.

## Använd inte mönstret när

{: .kommentar}
> Kan vi ta bort rubrik när det inte är relevant?

## Så fungerar mönstret

Hjälp alla användare att skanna en QR-kod genom att se till att:

- QR-koden inte döljs när sidan är förstorad till 400 procent
- QR-koden följer med (”sticky”) om användaren förminskar eller ändrar storlek på webbläsarfönstret
- QR-koden alltid syns i sin helhet, oberoende av webbläsarfönstrets storlek
- QR-koden fungerar även i högkontrastläge med inverterade färger (mörkt läge)
  - Vit ram runt själva koden
- Det finns tillräckligt med tid (minst 3 minuter) innan time-out
- Instruktionerna är tydliga och fungerar även för den som använder skärmläsare
- Det är möjligt att klicka för att förstora QR-koden (som en modal)
- Den förstorade QR-koden går att stänga med escape-tangenten, ESC (som modal)

## Exempel

Förenklat exempel på inloggning med QR-kod och Mobilt BankID. Använd knappen i exemplet för att växla hela sidan mellan ljust och mörkt läge – QR-koden behåller sin vita ram i båda lägena.

{% include qr-kod-example.html %}

## Bra exempel på stödtext

Här loggar du in med BankID på en annan enhet, till exempel din mobiltelefon eller läsplatta. Om ditt BankID finns på den enhet du använder nu, logga in med BankID på den här enheten.

### BankID med QR-kod

Så här gör du:

- Öppna appen för BankID.
- Tryck på QR-symbolen i appen för BankID.
- Rikta kameran mot QR-koden.
- Följ instruktionerna i appen för att logga in.

Efter att du väljer att visa QR-koden har du minst 3 minuter på dig att skanna den. Sedan avbryts inloggningen av säkerhetsskäl. Du kan då prova igen.

### Forskning/användartestning av mönstret

- [Tillgänglig inloggning med QR-kod (axbom.se)](https://axbom.se/tillganglig-inloggning-med-qr-kod/)

### Utvecklarstöd på bankid.com

- [Skanna QR-kod (BankID)](https://support.bankid.com/sv/anvanda-mobilt-bankid/skanna-qr-kod)
