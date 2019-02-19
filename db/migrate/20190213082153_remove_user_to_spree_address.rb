class RemoveUserToSpreeAddress < ActiveRecord::Migration[5.2]
  def change
  	remove_column :spree_addresses, :user_id
  end
end
