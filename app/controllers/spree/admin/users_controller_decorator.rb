Spree::Admin::UsersController.class_eval do

  def create
    @user = Spree.user_class.new(user_params)
    if @user.save(validate: false)
      flash[:success] = flash_message_for(@user, :successfully_created)
      redirect_to edit_admin_user_path(@user)
    else
      render :new
    end
  end

  def update
    
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    @user.assign_attributes(user_params)
    if @user.save(validate: false)

      flash[:success] = Spree.t(:account_updated)
      redirect_to edit_admin_user_path(@user)
    else
      render :edit
    end
  end

end
