class AddUserOrderToStoreContact < ActiveRecord::Migration[5.2]
  def change
  	add_column :spree_contact_stores, :user_id, :integer
	add_column :spree_contact_stores, :order_id, :integer
	add_index :spree_contact_stores, :user_id
	add_index :spree_contact_stores, :order_id
  end
end





