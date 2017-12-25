class CryptosController < ApplicationController

  def index
    @cryptos = Crypto.all
  end

  def show
  end

  private

  def crypto_params
    params.require(:crypto).permit(:name, :photo, :photo_cache)
  end

end
