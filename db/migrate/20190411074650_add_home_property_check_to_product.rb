class AddHomePropertyCheckToProduct < ActiveRecord::Migration[5.2]
  def change
  	add_column :spree_products, :to_home,  :boolean, :default => false
  	add_column :spree_products, :property, :string
  end
end
