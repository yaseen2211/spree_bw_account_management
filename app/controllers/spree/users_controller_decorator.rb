Spree::UsersController.class_eval do

  def edit
    @orders = @user.orders.includes(line_items: [variant: [:option_values, :images, :product]], bill_address: :state, ship_address: :state)
  end

  def update
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

end