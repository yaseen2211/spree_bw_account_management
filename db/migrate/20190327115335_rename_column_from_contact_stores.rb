class RenameColumnFromContactStores < ActiveRecord::Migration[5.2]
  def change
  	rename_column :spree_contact_stores, :type, :query_type
  end
end
