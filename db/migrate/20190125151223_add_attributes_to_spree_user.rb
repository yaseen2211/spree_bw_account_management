class AddAttributesToSpreeUser < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_users, :first_name, :string
    add_column :spree_users, :last_name, :string
    add_column :spree_users, :phone_number, :string
    add_column :spree_users, :date_of_birth, :number
    add_column :spree_users, :month_of_birth, :string
    add_column :spree_users, :head, :float
    add_column :spree_users, :left_shoulder, :float
    add_column :spree_users, :right_shoulder, :float
    add_column :spree_users, :left_arm, :float
  end
end
