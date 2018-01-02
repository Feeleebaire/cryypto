class CryptosController < ApplicationController
  before_action :set_crypto, only: [:show]
  def index
    @cryptos = Crypto.all
  end

  def show
    @cryptos = Crypto.all
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
    end
  @tweets = client.search("##{@crypto.name}")

  end

  private

  def crypto_params
    params.require(:crypto).permit(:name, :photo, :photo_cache)
  end

  def set_crypto
    @crypto = Crypto.find(params[:id])
  end

end
