#!/bin/bash

# cSpell:disable
# This script uses technical terms like "networkidle" and "wcag" which are valid in this context

URL="${1:-https://pattespatte.github.io/swedish-healthcare-demo-site/}"
OUTPUT="accessibility-report"

# Check if Node.js is installed
if ! command -v node &>/dev/null; then
	echo "❌ Error: Node.js is not installed. Please install Node.js to run this script."
	exit 1
fi

# Check if npm is installed
if ! command -v npm &>/dev/null; then
	echo "❌ Error: npm is not installed. Please install npm to run this script."
	exit 1
fi

# Check if dependencies are already installed
if [ ! -d "node_modules/playwright" ] || [ ! -d "node_modules/axe-playwright" ]; then
	echo "🔍 Installing dependencies..."
	npm install --silent playwright axe-playwright
else
	echo "✅ Dependencies already installed"
fi

# Check if Playwright browsers are installed
if ! npx playwright --version 2>/dev/null | grep -q "Version" || ! npx playwright install-deps 2>/dev/null; then
	echo "🌐 Installing Playwright browsers..."
	npx playwright install chromium --with-deps
else
	echo "✅ Playwright browsers already installed"
fi

echo "🕷️ Auditing $URL..."

# Create a temporary JavaScript file with the script
cat >temp_audit.cjs <<'EOF'
const { chromium } = require('playwright');
const { injectAxe, getViolations } = require('axe-playwright');
const fs = require('fs');

const baseUrl = process.argv[2];
const outputDir = process.argv[3];

if (!fs.existsSync(outputDir)) fs.mkdirSync(outputDir, { recursive: true });

const visited = new Set();
const toVisit = [baseUrl];
const results = [];

async function extractLinks(page) {
	return await page.$$eval('a[href]', (links, base) => {
		const baseURL = new URL(base);
		return links
			.map(a => {
				try {
					const url = new URL(a.href, base);
					url.hash = '';
					if (url.origin === baseURL.origin) return url.href;
				} catch (e) {}
				return null;
			})
			.filter(Boolean);
	}, baseUrl);
}

(async () => {
	const browser = await chromium.launch({ headless: true });
	const page = await browser.newPage();

	console.log('\n🕷️  Crawling and testing...\n');

	while (toVisit.length > 0) {
		const url = toVisit.shift();
		if (visited.has(url)) continue;
		visited.add(url);

		try {
			console.log(`📄 ${url}`);
			await page.goto(url, { waitUntil: 'domcontentloaded', timeout: 30000 });
			
			await injectAxe(page);
			const violations = await getViolations(page, null, {
				runOnly: ['wcag2a', 'wcag2aa', 'wcag21a', 'wcag21aa']
			});

			const count = violations.length;
			console.log(`   ${count === 0 ? '✅' : '❌'} ${count} violations`);

			results.push({ url, violations, count });

			// Find new links
			const links = await extractLinks(page);
			links.forEach(link => {
				if (!visited.has(link) && !toVisit.includes(link)) toVisit.push(link);
			});

		} catch (error) {
			console.log(`   ⚠️  Error: ${error.message}`);
			results.push({ url, error: error.message, count: -1 });
		}
	}

	await browser.close();

	// Summary
	const totalPages = results.length;
	const totalViolations = results.reduce((sum, r) => sum + (r.count > 0 ? r.count : 0), 0);
	const pagesWithIssues = results.filter(r => r.count > 0).length;

	// Save results
	fs.writeFileSync(`${outputDir}/results.json`, JSON.stringify(results, null, 2));

	// Generate HTML
	const html = `<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Accessibility Report</title>
	<style>
		body { font-family: system-ui, sans-serif; max-width: 1200px; margin: 40px auto; padding: 20px; }
		h1 { color: #1e40af; }
		.summary { background: #f3f4f6; padding: 20px; border-radius: 8px; margin: 20px 0; display: flex; gap: 30px; }
		.stat { text-align: center; }
		.stat-value { font-size: 3em; font-weight: bold; }
		.stat-label { color: #6b7280; margin-top: 5px; }
		table { width: 100%; border-collapse: collapse; background: white; }
		th, td { text-align: left; padding: 12px; border-bottom: 1px solid #e5e7eb; }
		th { background: #f9fafb; font-weight: 600; position: sticky; top: 0; }
		.pass { color: #059669; font-weight: bold; }
		.fail { color: #dc2626; font-weight: bold; }
		.error { color: #f59e0b; }
	</style>
</head>
<body>
	<h1>🔍 Accessibility Audit</h1>
	<div class="summary">
		<div class="stat"><div class="stat-value" style="color: #1e40af;">${totalPages}</div><div class="stat-label">Pages</div></div>
		<div class="stat"><div class="stat-value" style="color: #dc2626;">${totalViolations}</div><div class="stat-label">Violations</div></div>
		<div class="stat"><div class="stat-value" style="color: #059669;">${totalPages - pagesWithIssues}</div><div class="stat-label">Clean Pages</div></div>
	</div>
	<table>
		<thead><tr><th>Page</th><th>Status</th></tr></thead>
		<tbody>
		${results.map(r => {
			const urlShort = r.url.replace(baseUrl, '/') || '/';
			let status;
			if (r.count === -1) status = '<span class="error">Error</span>';
			else if (r.count === 0) status = '<span class="pass">✓ Pass</span>';
			else status = `<span class="fail">✗ ${r.count} violations</span>`;
			return `<tr><td><a href="${r.url}" target="_blank">${urlShort}</a></td><td>${status}</td></tr>`;
		}).join('')}
		</tbody>
	</table>
	<p style="margin-top: 40px; color: #6b7280;">
		Generated: ${new Date().toLocaleString()}<br>
		Detailed JSON: results.json
	</p>
</body>
</html>`;

	fs.writeFileSync(`${outputDir}/report.html`, html);

	console.log(`\n📊 Summary:`);
	console.log(`   Pages: ${totalPages}`);
	console.log(`   Total violations: ${totalViolations}`);
	console.log(`   Pages with issues: ${pagesWithIssues}`);
	console.log(`\n📁 Report: ${outputDir}/report.html\n`);
})();

// Handle any uncaught errors
process.on('unhandledRejection', (reason, promise) => {
	console.error('Unhandled Rejection at:', promise, 'reason:', reason);
});
EOF

# Execute the script with arguments
node temp_audit.cjs "$URL" "$OUTPUT"
NODE_EXIT_CODE=$?

# Clean up the temporary file
rm -f temp_audit.cjs

if [ $NODE_EXIT_CODE -ne 0 ]; then
	echo "❌ Script failed with exit code $NODE_EXIT_CODE"
	exit $NODE_EXIT_CODE
fi

echo "✅ Done!"
open "$OUTPUT/report.html" 2>/dev/null || echo "Open: $OUTPUT/report.html"
