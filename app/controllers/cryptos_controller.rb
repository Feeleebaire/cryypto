class CryptosController < ApplicationController
  before_action :set_crypto
  def index
    @cryptos = Crypto.all
  end

  def show
  end

  private

  def crypto_params
    params.require(:crypto).permit(:name, :photo, :photo_cache)
  end

  def set_crypto
    @crypto = Crypto.find(params[:id])
  end

end
