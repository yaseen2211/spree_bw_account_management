class CreateContactStoresTable < ActiveRecord::Migration[5.2]
  def change
    create_table :spree_contact_stores do |t|
      t.integer :vendor_id
      t.string :subject
      t.string :query
      t.string :type
    end
  end
end
