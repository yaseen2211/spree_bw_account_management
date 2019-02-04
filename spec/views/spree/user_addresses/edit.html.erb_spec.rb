require 'rails_helper'

RSpec.describe "spree/user_addresses/edit", type: :view do
  before(:each) do
    @spree_user_address = assign(:spree_user_address, Spree::UserAddress.create!())
  end

  it "renders the edit spree_user_address form" do
    render

    assert_select "form[action=?][method=?]", spree_user_address_path(@spree_user_address), "post" do
    end
  end
end
