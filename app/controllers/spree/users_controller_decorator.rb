Spree::UsersController.class_eval do

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

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :phone_number, :date_of_birth,:month_of_birth, 
                                      :head, :left_shoulder, :right_shoulder, :left_arm,
                                      :email_confirmation, :country
                                      )
    end

end


