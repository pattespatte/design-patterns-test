---
layout: default
title: Så här redigerar du
parent: Om webbplatsen
status: granskning
nav_order: 2
---

# Så här redigerar du

Den här guiden beskriver hur du arbetar med designmönstren — från kommentarer och granskningsläge till sidstatus och publicering.

## Granskningsläge (review mode)

Webbplatsen har två lägen:

**Publikt läge** (standard)
: Alla sidor visas utan kommentarer. Sidor med status `granskning` eller `opublicerad` döljs från navigationen.

**Granskningsläge** (`?review`)
: Lägg till `?review` i webbadressen, till exempel:
: `https://pattespatte.github.io/design-patterns-test/docs/datum.html?review`
: Granskningsläget visar kommentarer, en knapp för att visa/dölja kommentarer, och sidor som är under granskning. Läget sparas automatiskt medan du surfar mellan sidor.

Läget försvinner när du stänger webbläsarfliken.

## Kommentarer (kommentar)

Använd kommentarer för att lämna redaktionella anteckningar — frågor, osäkerheter eller påminnelser till andra skribenter.

### Skriva en kommentar

Använd ett blockcitat med klassen `.kommentar`:

```markdown
{: .kommentar}
> Här behöver vi kolla med juridik om detta stämmer.
```

### Kommentar med författare

Lägg till en tom rad och en attributionsrad med `—`:

```markdown
{: .kommentar}
> Detta gäller bara för svenska pass. Andra länders format kan skilja sig.
>
> — 2024-11-25 /Patrik E.
```

Attributionsraden (datum och namn) visas automatiskt i kursiv stil, mindre text och högerjusterad.

### Så ser kommentarerna ut

Kommentarerna visas som gula post-it-lappar med viket hörn. I mörkt läge får de en mörk olivfärg. De döljs automatiskt vid utskrift.

## Sidstatus

Varje sida har en `status` i front matter som visas som en färgad etikett:

| Status | Färg | Betydelse |
|--------|------|-----------|
| `utkast` | Gul | Sidan är under arbete |
| `granskning` | Blå | Sidan är under granskning |
| `godkänd` | Grön | Sidan är godkänd och publicerad |
| `utgått` | Röd | Sidan är ej längre aktuell |

**Synlighet i navigationen:**

| Status | Publikt läge | Granskningsläge |
|--------|-------------|-----------------|
| `utkast` | Synlig | Synlig |
| `granskning` | **Dold** | Synlig |
| `godkänd` | Synlig | Synlig |
| `opublicerad` | **Dold** | **Dold** |

## Dölja sidor

### Dölja från navigationen

```yaml
---
nav_exclude: true
search_exclude: true
---
```

Sidan byggs fortfarande och är tillgänglig via direktlänk.

### Förhindra att sidan byggs

```yaml
---
published: false
---
```

Sidan byggs inte alls — varken lokalt eller på GitHub Pages.

## Sidans struktur

Varje designmönster följer samma struktur:

```markdown
---
layout: default
title: Namn på mönstret
parent: Designmönster
status: utkast
nav_order: 150
---

**Fråga användare efter**

# Namn på mönstret

## Använd mönstret när

Beskrivning av när mönstret är lämpligt.

## Använd inte mönstret när

Beskrivning av när mönstret inte bör användas.

## Så fungerar mönstret

Detaljerad beskrivning av hur mönstret fungerar.
```

## Status för den här sidan

Denna guide har status `granskning` och syns därför bara i granskningsläge.
