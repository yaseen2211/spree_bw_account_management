require 'rails_helper'

RSpec.describe "spree/user_addresses/new", type: :view do
  before(:each) do
    assign(:spree_user_address, Spree::UserAddress.new())
  end

  it "renders new spree_user_address form" do
    render

    assert_select "form[action=?][method=?]", spree_user_addresses_path, "post" do
    end
  end
end
