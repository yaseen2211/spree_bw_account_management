require 'rails_helper'

RSpec.describe "spree/user_addresses/show", type: :view do
  before(:each) do
    @spree_user_address = assign(:spree_user_address, Spree::UserAddress.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
