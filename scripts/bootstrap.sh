#!/bin/bash

# Install required system packages
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    brew install ruby node
    gem install bundler
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    sudo apt-get update
    sudo apt-get install -y ruby-dev ruby-bundler nodejs build-essential gcc make
fi

# Install Ruby dependencies
bundle config set --local path 'vendor/bundle'
bundle install

# Start local server
echo "Setup complete! Run 'bundle exec jekyll serve -l -H localhost' to start the local server" 