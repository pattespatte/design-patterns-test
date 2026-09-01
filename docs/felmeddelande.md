---
layout: default
title: Felmeddelande
parent: Designmönster
status: utkast
nav_order: 70
---

**Fråga användare efter**

# Felmeddelande

Hjälp användaren att förstå och åtgärda fel i specifika fält.

{: .kommentar}
> Svensk anpassning av [Error message](https://design-system.service.gov.uk/components/error-message/) från GOV.UK Design System.

## Använd mönstret när

- ett obligatoriskt fält inte har fyllts i
- informationen i ett fält har fel format, till exempel en e-postadress utan @
- informationen inte stämmer, till exempel ett datum som ligger i framtiden

## Använd inte mönstret när

- användaren ännu inte har försökt skicka in formuläret. Visa inte felmeddelanden medan användaren fyller i eller stegar sig igenom formuläret.
- du vill vägleda användaren i förväg. Använd i stället hjälptext eller kravmarkering.
- informationen inte handlar om ett specifikt fält. Använd i stället fellista för att sammanfatta fel i formuläret.

## Så fungerar mönstret

Felmeddelandet visas ovanför fältet som det gäller och inleds med en varningsikon. Fältet markeras med röd färg och en tjockare ram. Markeringen ska vara tydligt åtskild från tabbfokus, som ritas som en blå ram runt fältet.

Skriv felmeddelandet så att det:

- talar om vad användaren behöver göra, till exempel ”Skriv en giltig e-postadress”
- är kort och går att förstå utan omväg
- inte förebrår eller pekar ut användaren

Följ dessa riktlinjer:

- Placera felmeddelandet ovanför fältet, mellan hjälptexten och fältet.
- Sätt varningsikonen före texten i felmeddelandet.
- Markera fältet med röd färg och tjockare ram så att användaren ser vilket fält som är felaktigt.
- Validera först när användaren skickar in formuläret, så att det går att stega sig igenom formuläret utan att felmeddelanden visas.
- Ta bort felmeddelandet så snart användaren har rättat fältet.
- Vid flera fel sammanfattas felen högst upp på sidan och fokus sätts på sammanfattningen, som innehåller länkar till de fält som är felaktiga. Då behöver användaren inte scrolla upp till meddelanderutan. Se mönstret Fellista.

## Exempel

{% include error-message-example.html %}

Exemplet ovan är inspirerat av [Felmeddelande](https://designsystem.forsakringskassan.se/latest/components/validation/ferrormessage.html) från Försäkringskassans designsystem.
