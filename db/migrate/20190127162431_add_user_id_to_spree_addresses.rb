class AddUserIdToSpreeAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_addresses, :user_id, :integer
    add_index :spree_addresses, :user_id
  end
end
