class AddProfileImageToUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :spree_users, :profile_image, :string
  end
end
