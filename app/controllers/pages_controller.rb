class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "TWITTER_CONSUMER_KEY"
      config.consumer_secret     = "TWITTER_CONSUMER_SECRET"
      config.access_token        = "TWITTER_ACCESS_TOKEN"
      config.access_token_secret = "TWITTER_ACCESS_SECRET"
    end
    @client = client.search("#ruby -rt", lang: "ja").first.text
  end
end
