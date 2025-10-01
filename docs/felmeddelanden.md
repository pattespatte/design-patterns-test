---
layout: default
title: Felmeddelanden
parent: Designmönster
nav_order: 2
---

# Felmeddelanden

Tydliga felmeddelanden hjälper användare att rätta till misstag.

## Principer för bra felmeddelanden

1. **Var specifik** - Beskriv exakt vad som är fel
2. **Var hjälpsam** - Förklara hur användaren kan åtgärda felet
3. **Var vänlig** - Använd en neutral ton, skuldbelägg inte användaren

## Exempel

<div class="example">
  <div class="error-message" role="alert">
    <h3>Det finns ett problem</h3>
    <ul>
      <li><a href="#personnummer">Ange personnummer i formatet ÅÅÅÅMMDD-XXXX</a></li>
      <li><a href="#epost">Ange en giltig e-postadress</a></li>
    </ul>
  </div>
</div>

## Placering

- Visa felsammanfattning högst upp på sidan
- Markera felfält med röd ram
- Placera specifika felmeddelanden direkt under berörda fält