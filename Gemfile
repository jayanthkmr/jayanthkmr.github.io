source "https://rubygems.org"

# Hello! This is where you manage which Jekyll version is used to run.
# When you want to use a different version, change it below, save the
# file and run `bundle install`. Run Jekyll with `bundle exec`, like so:
#
#     bundle exec jekyll serve
#
# This will help ensure the proper Jekyll version is running.
# Happy Jekylling!

# For GitHub Pages compatibility
gem "github-pages", "~> 232", group: :jekyll_plugins

# Core dependencies
gem "webrick", "~> 1.8.1"
gem "tzinfo", ">= 1.2.10"
gem "tzinfo-data" if Gem.win_platform?
gem "wdm", "~> 0.1.0" if Gem.win_platform?

# Feed parsing dependencies
gem "feedjira", "~> 3.2.5"
gem "httparty", "~> 0.21.0"
gem "nokogiri", "~> 1.16.0"
gem "reverse_markdown", "~> 2.1.1"
gem "faraday-retry", "~> 2.2"

# Development dependencies
group :development do
  gem "hawkins"  # Enables livereload functionality
end

# Jekyll plugins - these are included in github-pages, no need to specify versions
group :jekyll_plugins do
  gem "jekyll-archives"
  gem "jekyll-feed"
  gem "jekyll-sitemap"
  gem "jekyll-include-cache", "~> 0.1"
  gem "jekyll-paginate"
  gem "jemoji"
end

# Security updates
gem "activesupport", ">= 6.1.7.5"
gem "commonmarker", ">= 0.23.10"
gem "addressable", ">= 2.8.5"

# Ensure Ruby version compatibility
ruby "~> 3.4.0"
