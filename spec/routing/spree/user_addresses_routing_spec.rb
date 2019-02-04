require "rails_helper"

RSpec.describe Spree::UserAddressesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/spree/user_addresses").to route_to("spree/user_addresses#index")
    end

    it "routes to #new" do
      expect(:get => "/spree/user_addresses/new").to route_to("spree/user_addresses#new")
    end

    it "routes to #show" do
      expect(:get => "/spree/user_addresses/1").to route_to("spree/user_addresses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/spree/user_addresses/1/edit").to route_to("spree/user_addresses#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/spree/user_addresses").to route_to("spree/user_addresses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/spree/user_addresses/1").to route_to("spree/user_addresses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/spree/user_addresses/1").to route_to("spree/user_addresses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/spree/user_addresses/1").to route_to("spree/user_addresses#destroy", :id => "1")
    end
  end
end
