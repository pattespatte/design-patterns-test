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

rbenv install 3.4.7
rbenv global 3.4.7

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
# Make sure local template is active

awk '
/^remote_theme: just-the-docs\/just-the-docs@v0.10.1$/ {
    print "# " $0
    next
}
/^# theme: just-the-docs$/ {
    $0 = "theme: just-the-docs"
}
1
' _config.yml > temp && mv temp _config.yml

# bundle exec jekyll serve

# Start with live reload
bundle exec jekyll serve --livereload

# With shorter local URL (http://localhost:4000)
# bundle exec jekyll serve --baseurl="" --livereload

# If you want to access from other devices on the network
# bundle exec jekyll serve --host 0.0.0.0 --livereload

# Reset and activate remote template
awk '
/^# remote_theme: just-the-docs\/just-the-docs@v0.10.1$/ {
    sub(/^# /, "")
}
/^theme: just-the-docs$/ {
    $0 = "# " $0
}
1
' _config.yml > temp && mv temp _config.yml

# Visit your local site
# Open your browser and go to:

open http://127.0.0.1:4000/design-patterns-test/
```

Remember to set this back in `_config.yml` to remote template before checking in updates:

```bash
remote_theme: just-the-docs/just-the-docs@v0.10.1
# theme: just-the-docs
```
