module Spree
  class ContactStoresController < Spree::BaseController
    before_action :load_vendor

    def new
      @contact_store = @vendor.contact_stores.new
      @order = spree_current_user.orders.find_by(number: params[:order_number])
    end

    def create
      @contact_store = @vendor.contact_stores.new(contact_store_params)
      if @contact_store.save
        redirect_to spree.edit_account_path
      else
        render :new
      end
    end

    private

    def load_vendor
      @vendor = Spree::Vendor.find(params[:vendor_id])
    end

    def permitted_contact_store_attributes
      [:subject, :query, :type]
    end

    def contact_store_params
      params.require(:contact_store).permit(permitted_contact_store_attributes)
    end

  end
end