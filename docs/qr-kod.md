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

- Användaren ska logga in med BankID. Det är obligatoriskt med QR-kod för mobild BankID.

## Använd inte mönstret när (kan vi ta bort rubrik när det inte är relevant)

Hjälp alla användare att skanna en QR-kod genom att se till att:

- Att QR-koden inte döljs när sidan är förstorad till 400 procent 
- QR-koden följer med (”sticky”) om användaren förminskar eller ändrar storlek på webbläsarfönstret.
- QR-koden alltid syns i sin helhet, oberoende av webbläsarfönstret storlek. 
- QR-koden fungerar även i högkontrastläge med inverterade färger (mörkt läge).
  - Vit ram runt själva koden.
- Det finns tillräckligt med tid (minst 3 minuter) innan time-out
- Att instruktioner är tydliga och fungerar även för den som använder skärmläsare.
- Gör det möjligt att klicka för att förstora QR-koden (som en modal)
- Se till att förstorad QR-kod går att stänga med escape-tangenten, ESC (som modal)

## Exempel
Exempel på QR-kod i mörkt läge från Handelsbanken:

<picture>
  <source srcset="../assets/images/handelsbanken-qr-kod.webp" type="image/webp">
  <img src="../assets/images/handelsbanken-qr-kod.jpg"
    alt="Exempel från Handelsbanken som visar QR-kod för inloggning med BankID i mörkt läge med vit ram runt koden"
    loading="lazy"
    width="1180"
    height="1141">
</picture>

### Forskning/användartestning av mönstret
- [Tillgänglig inloggning med QR-kod (axbom.se)](https://axbom.se/tillganglig-inloggning-med-qr-kod/)
- 
### Utvecklarstöd på bankit.com
(https://support.bankid.com/sv/anvanda-mobilt-bankid/skanna-qr-kod)
