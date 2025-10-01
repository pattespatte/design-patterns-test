---
layout: default
title: Adressformulär
parent: Designmönster
nav_order: 1
---

# Adressformulär

Använd detta mönster när du behöver samla in användarens adress.

## När ska detta användas

Använd adressformulär när du behöver:
- Leveransadress för tjänster
- Faktureringsadress
- Folkbokföringsadress

## Exempel

<div class="example">
  <h3>Leveransadress</h3>
  <form>
    <label for="gatuadress">Gatuadress</label>
    <input type="text" id="gatuadress" name="gatuadress" autocomplete="street-address">
    
    <label for="postnummer">Postnummer</label>
    <input type="text" id="postnummer" name="postnummer" autocomplete="postal-code" pattern="[0-9]{5}">
    
    <label for="postort">Postort</label>
    <input type="text" id="postort" name="postort" autocomplete="address-level2">
  </form>
</div>

## Tillgänglighet

- Använd alltid `autocomplete`-attribut för bättre användarupplevelse
- Gruppera relaterade fält med `fieldset` och `legend`
- Validera postnummer men var flexibel med format (tillåt mellanslag)

<div class="do-dont">
  <div class="do">
    <strong>✓ Gör så här</strong>
    <p>Använd separata fält för gatuadress, postnummer och postort</p>
  </div>
  <div class="dont">
    <strong>✗ Undvik detta</strong>
    <p>Använd inte ett stort textfält för hela adressen</p>
  </div>
</div>

## Relaterat

- [Namn](namn)
- [Gov.uk - Addresses](https://design-system.service.gov.uk/patterns/addresses/)