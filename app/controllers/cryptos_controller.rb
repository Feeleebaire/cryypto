class CryptosController < ApplicationController


  private

  def crypto_params
    params.require(:crypto).permit(:name, :photo, :photo_cache)
  end
end
