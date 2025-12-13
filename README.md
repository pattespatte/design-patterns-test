# Install

## Ruby

```bash

# Check your Ruby version (needs to be 2.5 or higher)

ruby -v

# Check if Bundler is installed

bundler -v

# If not installed, install it

gem install bundler

# Install rbenv to manage Ruby versions

brew install rbenv ruby-build

# Install the latest Ruby

rbenv install 3.2.2
rbenv global 3.2.2

# Verify

ruby -v
```

## Dependencies from Gemfile

```bash
## 🛠️ Install Bundler

gem install bundler
gem install github-pages -v 232
gem install jekyll-livereload
```

## 🚀 Start local server

```bash
# Option 1
# Start with live reload and automatic theme reset (http://localhost:4000/design-patterns-test/)
./_scripts/start-local-server.sh --livereload

# Option 2
# With shorter local URL (http://localhost:4000)
# ./_scripts/start-local-server.sh --baseurl="" --livereload

# Option 3
# If you want to access from other devices on the network (http://localhost:4000, http://192.168.0.100:4000 etc.)
# ./_scripts/start-local-server.sh --host 0.0.0.0 --livereload
```

> The script automatically switches to the local theme before starting and restores the remote theme when stopped. It works across macOS, Linux, and Windows.

Remember to set this back in `_config.yml` to remote template before checking in updates:

```bash
remote_theme: just-the-docs/just-the-docs@v0.10.1
# theme: just-the-docs
```
