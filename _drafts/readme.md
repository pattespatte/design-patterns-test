---
layout: default
title: Utkast
published: false      # Kommer inte byggas i Github Pages
status: utkast        # Får "utkast" som etikett
parent: ""            # Ingen förälder
nav_exclude: true     # Ingår inte i navigationen
search_exclude: true  # Visas inte i sökresultat
---

# Välj status för sidan

## Statustabell

| Status (svenska) | Status (engelska) | Färg | Etikett | Betydelse |
|---|---|---|---|---|
| `utkast` | `draft` | Gul | `label-yellow` | Sidan är ett utkast och under arbete |
| `granskning` | `review` | Blå | `label-blue` | Sidan är under granskning |
| `godkänd` | `approved` | Grön | `label-green` | Sidan är godkänd och publicerad |
| `utgått` | `deprecated` | Röd | `label-red` | Sidan är utgången/ej längre aktuell |
| *övrigt* | — | Lila | `label-purple` | Allt annat värde får lila etikett (fallback) |

Både svenska och engelska värden stöds (de mappar till samma färg). Om du använder något annat värde än de fyra definierade visas en lila etikett som fallback.

---

Du kan förhindra att sidor genereras. Här är alternativen:

## Alternativ 1: `published: false` (Rekommenderas)

Använd Jekylls inbyggda `published` i front matter:

```yaml
---
layout: default
title: Sidans titel
parent: Föräldrasidan
published: false  # Sidan genereras inte alls
nav_order: 4
---
```

Detta **förhindrar helt** att sidan byggs i produktion (GitHub Pages).

## Alternativ 2: Utkast (för blogginlägg)

Om du använder blogginlägg, placera dem i mappen `_drafts/`:

```
_drafts/
  └── mitt-utkast.md
```

Dessa exkluderas automatiskt från produktionsbyggen.

## Alternativ 3: Dölj men bygg ändå

Om du vill att sidan ska byggas men döljas från navigation/sök:

```yaml
---
layout: default
title: Sidans titel
parent: Föräldrasidan
nav_exclude: true     # Dold från navigationen
search_exclude: true  # Dold från sök
nav_order: 4
---
```

**Obs:** Sidan är fortfarande tillgänglig via direkt-URL!

## Alternativ 4: Miljöbaserad publicering

Skapa `_layouts/draft.html`:

```html
---
layout: default
---

{% if jekyll.environment == "production" %}
  <div class="flash flash-warn">
    <strong>Denna sida är inte publicerad i produktion.</strong>
  </div>
{% endif %}

{% unless jekyll.environment == "production" %}
  {{ content }}
{% else %}
  <h1>Sidan är inte tillgänglig</h1>
  <p>Denna sida är under utveckling.</p>
{% endunless %}
```

Använd sedan layouten:

```yaml
---
layout: draft
title: Sidans titel
parent: Föräldrasidan
nav_order: 4
---
```

## Alternativ 5: Anpassad statuslogik

Skapa `_layouts/pattern.html`:

```html
---
layout: default
---

{% if page.status == "opublicerad" and jekyll.environment == "production" %}
  <div class="flash flash-error">
    <h2>Sidan är inte publicerad</h2>
    <p>Detta innehåll är fortfarande under utveckling.</p>
  </div>
{% else %}

  {% include status-badge.html %}

  {{ content }}

{% endif %}
```

Använd sedan:

```yaml
---
layout: default
title: Sidans titel
parent: Föräldrasidan
status: opublicerad
nav_order: 4
---
```

## Rekommenderat arbetssätt

### För helt opublicerade sidor

```yaml
---
layout: default
title: Adresser (Ej klar)
parent: Designmönster
published: false  # Byggs inte på GitHub Pages
nav_order: 4
---
```

### För utkast (synliga lokalt, dolda i navigationen)

```yaml
---
layout: default
title: Sidans titel
parent: Föräldrasidan
status: Utkast
nav_exclude: true    # Dold från sidomenyn
search_exclude: true # Dold från sök
nav_order: 4
---
```

### För pågående arbete (synligt men markerat)

```yaml
---
layout: default
title: Sidans titel
parent: Föräldrasidan
status: Utkast
nav_order: 4
---
```

## Testa lokalt mot produktion

**Lokal utveckling** (visar alla sidor):

```bash
bundle exec jekyll serve --livereload
```

**Lokalt produktionsläge** (efterliknar GitHub Pages):

```bash
JEKYLL_ENV=production bundle exec jekyll serve
```

Sidor med `published: false` visas inte i produktionsläge.

## Komplett exempel: Multistatussystem

### `_config.yml`

```yaml
# Definiera giltiga statusar
defaults:
  - scope:
      path: "docs"
    values:
      layout: "pattern"
```

### `_includes/status-badge.html`

```html
{% if page.status %}
  {% assign status = page.status | downcase %}

  {% if status == "opublicerad" or status == "unpublished" %}
    {% if jekyll.environment == "production" %}
      <!-- Dölj innehåll i produktion -->
    {% else %}
      <span class="label label-red">🚫 {{ page.status }}</span>
    {% endif %}
  {% elsif status == "utkast" or status == "draft" %}
    <span class="label label-yellow">✏️ {{ page.status }}</span>
  {% elsif status == "granskning" or status == "review" %}
    <span class="label label-blue">👀 {{ page.status }}</span>
  {% elsif status == "godkänd" or status == "approved" %}
    <span class="label label-green">✅ {{ page.status }}</span>
  {% elsif status == "utgått" or status == "deprecated" %}
    <span class="label label-red">⚠️ {{ page.status }}</span>
  {% endif %}
{% endif %}
```

### `_layouts/pattern.html`

```html
---
layout: default
---

{% if page.status == "opublicerad" and jekyll.environment == "production" %}
  <!-- Visa inte innehåll i produktion -->
  <div class="flash flash-warn">
    <h2>Sidan är inte tillgänglig</h2>
    <p>Detta innehåll är under utveckling.</p>
  </div>
{% else %}
  {% include status-badge.html %}
  {{ content }}
{% endif %}
```

### Användningsexempel

**Helt opublicerad** (byggs inte):

```yaml
---
title: Hemlig sida
published: false
---
```

**Utkast** (byggs, men dold):

```yaml
---
layout: default
title: Sidans titel
parent: Föräldrasidan
status: Utkast
nav_exclude: true
search_exclude: true
---
```

**Pågående arbete** (synlig med varning):

```yaml
---
layout: default
title: Sidans titel
parent: Föräldrasidan
status: Granskning
---
```

**Redo för produktion**:

```yaml
---
layout: default
title: Sidans titel
parent: Föräldrasidan
status: Godkänd
---
```

## Sammanfattningstabell

| Metod | Byggs? | I navigationen? | I sökresultat? | Tillgänglig via URL? |
|-------|--------|-----------------|----------------|----------------------|
| `published: false` | ❌ Nej | ❌ Nej | ❌ Nej | ❌ Nej |
| `nav_exclude: true` | ✅ Ja | ❌ Nej | ✅ Ja* | ✅ Ja |
| `search_exclude: true` | ✅ Ja | ✅ Ja* | ❌ Nej | ✅ Ja |
| `status: Utkast` | ✅ Ja | ✅ Ja | ✅ Ja | ✅ Ja |
| I `_drafts/` | ❌ Nej** | ❌ Nej | ❌ Nej | ❌ Nej |

*Om inte även exkluderat
**Byggs endast med flaggan `--drafts`
