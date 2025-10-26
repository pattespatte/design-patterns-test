#!/bin/bash

# Script to start Jekyll server with automatic theme switching
# Switches to local theme before starting and restores remote theme when stopped

set -e

# Function to switch to local theme
switch_to_local_theme() {
	echo "🔄 Switching to local theme..."
	awk '
/^remote_theme: just-the-docs\/just-the-docs@v0.10.1$/ {
    print "# " $0
    next
}
/^# theme: just-the-docs$/ {
    $0 = "theme: just-the-docs"
}
1
' _config.yml >temp && mv temp _config.yml
	echo "✅ Local theme activated"
}

# Function to restore remote theme
restore_remote_theme() {
	echo "🔄 Restoring remote theme..."
	awk '
/^# remote_theme: just-the-docs\/just-the-docs@v0.10.1$/ {
    sub(/^# /, "")
}
/^theme: just-the-docs$/ {
    $0 = "# " $0
}
1
' _config.yml >temp && mv temp _config.yml
	echo "✅ Remote theme restored"
}

# Function to open browser
open_browser() {
	# Cross-platform way to open browser
	if command -v open >/dev/null 2>&1; then
		# macOS
		open http://127.0.0.1:4000/design-patterns-test/
	elif command -v xdg-open >/dev/null 2>&1; then
		# Linux
		xdg-open http://127.0.0.1:4000/design-patterns-test/
	elif command -v start >/dev/null 2>&1; then
		# Windows
		start http://127.0.0.1:4000/design-patterns-test/
	else
		echo "🌐 Please open http://127.0.0.1:4000/design-patterns-test/ in your browser"
	fi
}

# Cleanup function to restore theme on exit
cleanup() {
	echo ""
	echo "🛑 Server stopped"
	restore_remote_theme
	exit 0
}

# Set up trap to restore theme on script exit
trap cleanup EXIT INT TERM

# Switch to local theme
switch_to_local_theme

# Start Jekyll server with passed arguments
echo "🚀 Starting Jekyll server..."
echo "📝 Server will be available at: http://127.0.0.1:4000/design-patterns-test/"
echo "🔄 Theme will be automatically restored when server stops"
echo ""

# Start server in background to allow for browser opening
bundle exec jekyll serve "$@" &
JEKYLL_PID=$!

# Wait a moment for server to start
sleep 3

# Open browser
open_browser

# Wait for Jekyll process to finish
wait $JEKYLL_PID
