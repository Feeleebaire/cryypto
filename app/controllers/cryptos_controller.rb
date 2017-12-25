class CryptosController < ApplicationController
  before_action :set_crypto, only: [:show]
  def index
    @cryptos = Crypto.all
  end

  def show
    @cryptos = Crypto.all
  end

  private

  def crypto_params
    params.require(:crypto).permit(:name, :photo, :photo_cache)
  end

  def set_crypto
    @crypto = Crypto.find(params[:id])
  end

end
