---
layout: default
title: Tillgänglighetsredogörelse
nav_order: 1
parent: Om webbplatsen
has_children: false
status: utkast
---

<div class="kommentar publik"><p>Detta är ett test. Redogörelsen är automatiskt genererad och kommer att skapas på ett korrekt sätt webbplatsen blir officiell och har ett komplett innehåll.</p></div>

# Tillgänglighet för Statliga designmönster

Den här webbplatsen drivs av _Arbetsgruppen för statliga designmönster_ och vi vill att så många som möjligt ska kunna använda den. På den här sidan beskriver vi hur webbplatsen uppfyller lagen om tillgänglighet till digital offentlig service, eventuella kända tillgänglighetsproblem och hur du kan rapportera brister till oss.

Gå direkt till webbplatsens startsida: <https://pattespatte.github.io/design-patterns-test/>

## Hur tillgänglig är webbplatsen?

Vi är medvetna om att delar av webbplatsen inte är helt tillgängliga. Se avsnittet om innehåll som inte är tillgängligt nedan för mer information.

## Vad kan du göra om du inte kan använda delar av webbplatsen?

Om du inte kan använda delar av webbplatsen kan du [meddela oss](https://github.com/pattespatte/design-patterns-test/issues/new) genom att skapa ett ärende i vårt formulär på GitHub. E-postadress och telefonnummer kompletteras när webbplatsen blir officiell.

## Rapportera brister i webbplatsens tillgänglighet

Vi strävar hela tiden efter att förbättra webbplatsens tillgänglighet. Om du upptäcker problem som inte är beskrivna på den här sidan, eller om du anser att vi inte uppfyller lagens krav, [meddela oss](https://github.com/pattespatte/design-patterns-test/issues/new) så att vi får veta att problemet finns.

Det hjälper oss om du berättar:

1. vilken sida du besökte
2. vad du försökte göra
3. vilket hjälpmedel du använder, till exempel skärmläsare eller förstoringsverktyg.

## Tillsyn

Myndigheten för digital förvaltning, Digg, har ansvaret för tillsyn över lagen om tillgänglighet till digital offentlig service. Du kan anmäla till Digg om du tycker att vår digitala service har brister i tillgänglighet.

Du kan också anmäla till Digg om du tycker att vår bedömning av vad som är oskäligt betungande ska granskas, om du tycker att vår tillgänglighetsredogörelse har brister eller om du tycker att vi inte har hanterat din begäran om tillgängliggörande korrekt.

Anmäl till Digg: [digg.se/tdosanmalan](https://www.digg.se/tdosanmalan)

## Teknisk information om webbplatsens tillgänglighet

Den här webbplatsen är delvis förenlig med lagen om tillgänglighet till digital offentlig service, på grund av de brister som beskrivs nedan.

Grunden är standarden EN 301 549, som hänvisar till riktlinjerna WCAG 2.1, nivå AA. Våra designmönster har WCAG 2.2, nivå AA, som mål.

## Innehåll som inte är tillgängligt

Det innehåll som beskrivs nedan är på ett eller annat sätt inte helt tillgängligt.

### Bristande förenlighet med lagkraven

#### Problem vid användning utan synförmåga

- Den första länken i sidmenyn saknar text, så skärmläsare läser inte upp något namn på länken och du kan inte veta vart den leder. Felet finns på webbplatsens alla sidor (WCAG 4.1.2).

#### Problem vid användning utan röstförmåga

- Länken i sidmenyn som saknar text går inte att välja med röststyrning, eftersom den inte har något namn att säga (WCAG 4.1.2).

#### Problem vid användning med nedsatt syn

- På sidan Redigera innehåll har färgmarkeringarna i kodexemplen för låg kontrast mot bakgrunden, vilket gör texten svårare att läsa (WCAG 1.4.3).

## Hur vi testat webbplatsen

Vi har gjort en självskattning (intern testning) av webbplatsen.

Senaste bedömningen gjordes den 2026-09-01.

Testningen omfattar hittills automatiserade kontroller med verktyget axe, körda över webbplatsens alla sidor. Manuell testning med skärmläsare och tangentbordsnavigering har ännu inte genomförts. Det kan därför finnas brister som de automatiska kontrollerna inte hittar.

Webbplatsen publicerades den 2025-10-26.

Redogörelsen uppdaterades senast den 2026-09-01.
