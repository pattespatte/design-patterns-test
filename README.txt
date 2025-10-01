# Install dependencies

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

# Install dependencies from Gemfile

## 🛠️ Install Bundler

gem install bundler
gem install github-pages -v 232
gem install jekyll-livereload

## 🚀 Start local server

# bundle exec jekyll serve

# Start with live reload
bundle exec jekyll serve --livereload

# With shorter local URL (http://localhost:4000)
# bundle exec jekyll serve --baseurl="" --livereload

# If you want to access from other devices on the network
# bundle exec jekyll serve --host 0.0.0.0 --livereload

# Visit your local site
# Open your browser and go to:

open http://localhost:4000/${project_name}/
