module Spree
  class ContactStoresController < Spree::StoreController
    before_action :load_required_objs, only: [:new,:create]

    def new
      @contact_store = @vendor.contact_stores.new
      @order  = spree_current_user.orders.find_by(number: params[:order_number])
    end

    def create

      @contact_store       = @vendor.contact_stores.new(contact_store_params)
      @contact_store.user  = @user
      @contact_store.order = @order
      if @contact_store.save
        redirect_to spree.edit_account_path
      else
        render "spree/#{params[:lang].to_s.present? ? params[:lang].to_s : DEFAULT_VIEW_LANG}/contact_stores/new"
      end
    end

    private

    def load_required_objs
      @vendor = Spree::Vendor.find(params[:vendor_id])
      @order  = spree_current_user.orders.find_by(number: params[:contact_store][:order_number]) if params[:contact_store].present?
      @user   = spree_current_user
    end

    def permitted_contact_store_attributes
      [:subject, :query, :query_type]
    end

    def contact_store_params
      params.require(:contact_store).permit(permitted_contact_store_attributes)
    end

  end
end