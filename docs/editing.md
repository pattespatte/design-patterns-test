---
layout: default
title: Redigera innehåll
parent: Om webbplatsen
nav_order: 1
---

# Redigera innehåll

Du kan redigera alla sidor direkt i GitHub — du behöver ingen särskild mjukvara.

## Redigera en befintlig sida

1. Gå till [docs-mappen på GitHub](https://github.com/pattespatte/design-patterns-test/tree/main/docs)
2. Klicka på filen du vill ändra
3. Klicka på pennikonen ✏️ högst upp till höger i filvyn
4. Gör dina ändringar
5. Spara enligt anvisningen nedan

![Pennikonen för att redigera filen i GitHub](/design-patterns-test/assets/images/redigera-pennikon.webp)

## Spara dina ändringar (commit)

När du har gjort klart dina ändringar:

1. Rulla ned till rutan **Commit changes** längst ner på sidan
2. Skriv en kort beskrivning av vad du ändrade, till exempel "Uppdaterat text om namn"
3. Välj **Commit directly to the `main` branch**
4. Klicka på knappen **Commit changes**

Ändringen publiceras automatiskt på webbplatsen inom några minuter.

![Rutan för att spara ändringar med commit](/design-patterns-test/assets/images/redigera-commit-ruta.webp)

## Ändra status på en sida

Varje sida har ett block med inställningar högst upp i filen. Blocket kallas front matter och omges av tre streck `---`.

### Gör en dold sida synlig

Leta efter raden `published: false` och ändra den till `published: true`:

```yaml
published: true
```

Du kan också ta bort hela raden `published: false` — då blir sidan synlig automatiskt.

### Ändra sidans status

Leta efter raden som börjar med `status:` och ändra värdet:

```yaml
status: utkast
```

Tillgängliga statusar:

| Status | Etikett | Använd när |
|--------|---------|------------|
| `utkast` | Gul | Sidan är under arbete |
| `granskning` | Blå | Sidan är redo för granskning |
| `godkänd` | Grön | Sidan är godkänd |
| `utgått` | Röd | Sidan är inte längre aktuell |

![Exempel på front matter högst upp i en fil](/design-patterns-test/assets/images/redigera-front-matter.webp)

## Lägga in en bild

### Steg 1: Ladda upp bildfilen

1. Gå till mappen [assets/images](https://github.com/pattespatte/design-patterns-test/tree/main/assets/images) på GitHub
2. Klicka på **Add file** och välj **Upload files**
3. Dra in din bild eller klicka för att bläddra
4. Använd ett beskrivande filnamn med små bokstäver, till exempel `namn-exempel.png`
5. Spara uppladdningen (commit)

### Steg 2: Lägg in bilden i texten

I din markdown-fil skriver du:

```markdown
![Beskrivande text om vad bilden visar](/design-patterns-test/assets/images/din-bild.png)
```

Byt ut `din-bild.png` mot filnamnet du laddade upp. Texten inom hakparenteserna är viktig för tillgängligheten — beskriv vad bilden visar.

![Uppladdning av bildfil och bildkod i markdown](/design-patterns-test/assets/images/redigera-bilduppladdning.webp)

## Skapa en ny sida

1. Gå till [docs-mappen](https://github.com/pattespatte/design-patterns-test/tree/main/docs) på GitHub
2. Klicka på **Add file** och välj **Create new file**
3. Skriv filnamnet — använd små bokstäver och bindestreck, till exempel `nytt-mönster.md`
4. Kopiera mallen nedan och klistra in
5. Anpassa titel, förälder och innehåll
6. Spara (commit)

### Mall för nytt designmönster

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

Beskriv när mönstret passar.

## Använd inte mönstret när

Beskriv när mönstret inte passar.

## Så fungerar mönstret

Beskriv hur mönstret fungerar.

## Exempel

Lägg till exempel om det finns.

## Referenser

- Länkar till källor och standarder
```

Välj `nav_order` utifrån var sidan ska hamna i menyn — ett tal mellan 100 och 900 bestämmer ordningen.

![Skapande av ny fil i docs-mappen](/design-patterns-test/assets/images/redigera-skapa-ny-fil.webp)

## Formatera text

Använd markdown för att formatera:

| Du skriver | Blir |
|------------|------|
| `**fetstil**` | **fetstil** |
| `*kursiv stil*` | *kursiv stil* |
| `# Rubrik` | Stor rubrik |
| `## Rubrik` | Mindre rubrik |
| `- listpunkt` | Punktlista |
| `1. första` | Numrerad lista |
| `[länktext](https://...)` | Klickbar länk |

## Granskningsläge

Lägg till `?review` i webbadressen för att se sidor under granskning:

<https://pattespatte.github.io/design-patterns-test/docs/datum.html?review>

I granskningsläget ser du kommentarer och sidor som har status `granskning`.

### Lämna en kommentar

Använd detta format för att skriva en kommentar till andra skribenter:

```markdown
{: .kommentar}
> Här behöver vi kolla med juridik om detta stämmer.
```

Kommentarer visas som gula post-it-lappar i granskningsläget.
