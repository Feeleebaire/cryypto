class AddPhotoToCryptos < ActiveRecord::Migration[5.1]
  def change
    add_column :cryptos, :photo, :string
  end
end
