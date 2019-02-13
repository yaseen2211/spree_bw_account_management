require 'rails_helper'

RSpec.describe "spree/user_addresses/index", type: :view do
  before(:each) do
    assign(:spree_user_addresses, [
      Spree::UserAddress.create!(),
      Spree::UserAddress.create!()
    ])
  end

  it "renders a list of spree/user_addresses" do
    render
  end
end
