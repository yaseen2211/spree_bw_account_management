class AddAdditionaAtriToSpreeUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :spree_users, :email_confirmation, :string
  	add_column :spree_users, :country, :string
  end
end
