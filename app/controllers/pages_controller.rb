require 'json'
require 'open-uri'
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]


  def home
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
    end

    @clients = client.search("#ripple")
    @bitcoin = client.search("#ETH")

    url = 'https://api.github.com/orgs/ripple'
    user_serialized = open(url).read
    @user = JSON.parse(user_serialized)

  end
end
