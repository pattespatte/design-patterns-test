---
layout: default
title: Drafts
published: false      # Will not be built in Github Pages
status: draft         # Will get "draft" as a label
parent: ""            # No parent
nav_exclude: true     # Will not be part of the navigation
search_exclude: true  # Will not show up in search
---

# Hide a page

You can prevent pages from being generated. Here are the options:

## Option 1: `published: false` (Recommended)

Use Jekyll's built-in `published` front matter:

```yaml
---
layout: default
title: The title of the page
parent: The parent page
published: false  # Page won't be generated at all
nav_order: 4
---
```

This **completely prevents** the page from being built in production (GitHub Pages).

## Option 2: Draft Posts (for Blog Posts)

If using posts, place them in `_drafts/` folder:

```
_drafts/
  └── my-draft-post.md
```

These are excluded from production builds automatically.

## Option 3: Hide but Still Build

If you want the page built but hidden from navigation/search:

```yaml
---
layout: default
title: The title of the page
parent: The parent page
nav_exclude: true     # Hidden from navigation
search_exclude: true  # Hidden from search
nav_order: 4
---
```

**Note:** The page is still accessible via direct URL!

## Option 4: Environment-Based Publishing

Create `_layouts/draft.html`:

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

Then use it:

```yaml
---
layout: draft
title: The title of the page
parent: The parent page
nav_order: 4
---
```

## Option 5: Custom Status Logic

Create `_layouts/pattern.html`:

```html
---
layout: default
---

{% if page.status == "Opublicerad" and jekyll.environment == "production" %}
  <div class="flash flash-error">
    <h2>Sidan är inte publicerad</h2>
    <p>Detta innehåll är fortfarande under utveckling.</p>
  </div>
{% else %}

  {% include status-badge.html %}

  {{ content }}

{% endif %}
```

Then:

```yaml
---
layout: default
title: The title of the page
parent: The parent page
status: Opublicerad
nav_order: 4
---
```

## Recommended Workflow

### For Truly Unpublished Pages

```yaml
---
layout: default
title: Adresser (Ej klar)
parent: Designmönster
published: false  # Won't build on GitHub Pages
nav_order: 4
---
```

### For Draft Pages (visible locally, hidden in navigation)

```yaml
---
layout: default
title: The title of the page
parent: The parent page
status: Utkast
nav_exclude: true    # Hidden from sidebar
search_exclude: true # Hidden from search
nav_order: 4
---
```

### For Work-in-Progress (visible but marked)

```yaml
---
layout: default
title: The title of the page
parent: The parent page
status: Utkast
nav_order: 4
---
```

## Testing Locally vs Production

**Local development** (shows all pages):

```bash
bundle exec jekyll serve --livereload
```

**Local production mode** (mimics GitHub Pages):

```bash
JEKYLL_ENV=production bundle exec jekyll serve
```

Pages with `published: false` won't show in production mode.

## Complete Example: Multi-Status System

### `_config.yml`

```yaml
# Define valid statuses
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
      <!-- Hide content in production -->
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

{% if page.status == "Opublicerad" and jekyll.environment == "production" %}
  <!-- Don't show content in production -->
  <div class="flash flash-warn">
    <h2>Sidan är inte tillgänglig</h2>
    <p>Detta innehåll är under utveckling.</p>
  </div>
{% else %}
  {% include status-badge.html %}
  {{ content }}
{% endif %}
```

### Usage Examples

**Completely unpublished** (won't build):

```yaml
---
title: Secret Page
published: false
---
```

**Draft** (builds, but hidden):

```yaml
---
layout: default
title: The title of the page
parent: The parent page
status: Utkast
nav_exclude: true
search_exclude: true
---
```

**Work in progress** (visible with warning):

```yaml
---
layout: default
title: The title of the page
parent: The parent page
status: Granskning
---
```

**Production ready**:

```yaml
---
layout: default
title: The title of the page
parent: The parent page
status: Godkänd
---
```

## Summary Table

| Method | Builds? | In Navigation? | In Search? | Accessible by URL? |
|--------|---------|----------------|------------|-------------------|
| `published: false` | ❌ No | ❌ No | ❌ No | ❌ No |
| `nav_exclude: true` | ✅ Yes | ❌ No | ✅ Yes* | ✅ Yes |
| `search_exclude: true` | ✅ Yes | ✅ Yes* | ❌ No | ✅ Yes |
| `status: Utkast` | ✅ Yes | ✅ Yes | ✅ Yes | ✅ Yes |
| In `_drafts/` | ❌ No** | ❌ No | ❌ No | ❌ No |

*Unless also excluded
**Only builds with `--drafts` flag
