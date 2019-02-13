class AddStreetAddressToSpreeAddresses < ActiveRecord::Migration[5.2]
  def change
  	 add_column :spree_addresses, :address3, :string
  end
end
