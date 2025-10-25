# Scripts

This directory contains utility scripts for the design-patterns-test project.

## start-server.sh

A cross-platform script to start the Jekyll development server with automatic theme management.

### Features

- Automatically switches to local theme before starting the server
- Automatically restores remote theme when the server stops (using trap)
- Cross-platform browser opening (macOS, Linux, Windows)
- Passes all arguments to the Jekyll serve command
- Provides clear status messages

### Usage

```bash
# Start with live reload
./scripts/start-server.sh --livereload

# With shorter local URL
./scripts/start-server.sh --baseurl="" --livereload

# Access from other devices on the network
./scripts/start-server.sh --host 0.0.0.0 --livereload
```

The script handles all the theme switching that was previously done manually with awk commands.
