class AddFlagImageToCountry < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_countries, :flag_image, :string
  end
end
