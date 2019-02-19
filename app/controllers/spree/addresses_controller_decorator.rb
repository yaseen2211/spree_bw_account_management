Spree::AddressesController.class_eval do 

  def make_address_primary
    spree_current_user.shipping_address = @address
    spree_current_user.billing_address  = @address
    @primary_address = spree_current_user.save(:validate => false)
  end


end


