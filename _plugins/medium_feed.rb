require 'feedjira'
require 'httparty'
require 'json'

module Jekyll
  class MediumFeedGenerator < Generator
    safe true
    priority :high

    def generate(site)
      feed_url = "https://jaykmr.medium.com/feed"
      feed_data = []

      begin
        response = HTTParty.get(feed_url)
        if response.success?
          feed = Feedjira.parse(response.body)
          feed.entries.each do |entry|
            feed_data << {
              'title' => entry.title,
              'url' => entry.url,
              'date' => entry.published.strftime('%Y-%m-%d'),
              'description' => entry.summary
            }
          end
        end
      rescue => e
        Jekyll.logger.warn "Medium Feed:", "Failed to fetch feed: #{e.message}"
      end

      # Store the feed data in site.data
      site.data['medium_feed'] = feed_data
    end
  end
end 