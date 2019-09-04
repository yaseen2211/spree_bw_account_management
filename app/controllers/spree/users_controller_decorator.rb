Spree::UsersController.class_eval do

  def edit
    @orders = @user.orders.includes(:products, line_items: [variant: [:option_values, :images, :product]], bill_address: :state, ship_address: :state)
    # products_ids = []
    # @orders.map do |order|
    #   products_ids << order.sub_orders.joins(:products).pluck(:"spree_products.id")
    # end
    # @products_ids = products_ids.flatten.uniq - @user.reviews.joins(:product).pluck("spree_products.id")
    reviewed_id = @user.reviews.joins(:product).pluck("spree_products.id")
    products_ids = []
    @orders.map do |order|
      products_ids << order.sub_orders.joins(:products).select(:"spree_products.id",:created_at)
    end
    products_ids = products_ids.flatten.uniq
    @products_ids = products_ids.reject do |p|
          reviewed_id.include? p[:id]
    end

  end

  def update
    if params[:personalized_info].present?
        params[:user][:physical_measurment] = params[:personalized_info]
    end
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    respond_to do |format|
      if @user.update_attributes(user_params)
        # flash[:success] = Spree.t(:account_updated)
        # redirect_to edit_admin_user_path(@user)
        format.html { redirect_to account_path, notice: Spree.t(:account_updated) }
        format.js
      else
        format.html { render action: "edit" }
        format.js
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :phone_number, :date_of_birth,:month_of_birth, 
                                      :head, :left_shoulder, :right_shoulder, :left_arm,
                                      :email_confirmation, :country,:profile_image, :physical_measurment
                                      )
    end

end


