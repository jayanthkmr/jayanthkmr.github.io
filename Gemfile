source "https://rubygems.org"

# Hello! This is where you manage which Jekyll version is used to run.
# When you want to use a different version, change it below, save the
# file and run `bundle install`. Run Jekyll with `bundle exec`, like so:
#
#     bundle exec jekyll serve
#
# This will help ensure the proper Jekyll version is running.
# Happy Jekylling!

# Core Jekyll dependencies
gem "jekyll", "~> 4.3.0"

# Core dependencies
gem "webrick", "~> 1.8.1"
gem "tzinfo", ">= 1.2.10"
gem "tzinfo-data" if Gem.win_platform?
gem "wdm", "~> 0.1.0" if Gem.win_platform?
gem "csv"  # Required for Ruby 3.4.0+

# Development dependencies
# group :development do
#   gem "hawkins"  # Enables livereload functionality - incompatible with Jekyll 4
# end

# Jekyll theme
gem "jekyll-theme-minimal"

# Jekyll plugins - basic set without nokogiri dependencies
group :jekyll_plugins do
  gem "jekyll-feed"
  gem "jekyll-sitemap"
  gem "jekyll-include-cache", "~> 0.1"
  gem "jekyll-paginate"
  gem "jekyll-gist"
  gem "jekyll-redirect-from"
  # gem "jemoji"  # Temporarily disabled due to nokogiri build issues with spaces in path
end

# Security updates
gem "activesupport", ">= 6.1.7.5"
gem "commonmarker", ">= 0.23.10"
gem "addressable", ">= 2.8.5"

# Ensure Ruby version compatibility
ruby "~> 3.4.0"
