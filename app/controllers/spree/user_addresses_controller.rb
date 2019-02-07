class Spree::UserAddressesController < Spree::StoreController

  before_action :set_spree_user_address, only: [:show, :edit, :update, :destroy,:make_address_primary]

  # GET /spree/user_addresses
  def index
    @spree_user_addresses = Spree::UserAddress.all
  end

  # GET /spree/user_addresses/1
  def show
  end

  # GET /spree/user_addresses/new
  def new
    @spree_user_address = spree_current_user.addresses.new
  end

  # GET /spree/user_addresses/1/edit
  def edit
  end

  # POST /spree/user_addresses
  def create
    @spree_user_address = spree_current_user.addresses.new(spree_user_address_params)
  end

  # PATCH/PUT /spree/user_addresses/1
  def update
    @user_address = @spree_user_address.update(spree_user_address_params)
  end

  # DELETE /spree/user_addresses/1
  def destroy
    
    is_primary = (spree_current_user.shipping_address.id || spree_current_user.billing_address.id) == @spree_user_address.id 

    if is_primary 
      @spree_user_address.errors.add(:alert, "Primary Address Can't be deleted");
    else
      @spree_user_address.destroy
    end

  end

  def make_address_primary
    @primary_address = spree_current_user.update(shipping_address: @spree_user_address , billing_address: @spree_user_address)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spree_user_address
      @spree_user_address = spree_current_user.addresses.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def spree_user_address_params
      params.require(:address).permit(:firstname, :lastname, :address1, :address2, :address3,:city, 
                                      :zipcode, :phone, :state_name, :alternative_phone, 
                                      :company, :state_id, :country_id
                                      )
    end
end


