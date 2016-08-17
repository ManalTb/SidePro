class UsersController < ApplicationController
  before_action :authenticate_user!

  before_action only: [:edit, :update] do
    params[:part] ||= 'password'
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = current_user
  end

  def update
  	@user = User.find(current_user.id)
    if update_user
      flash[:success] = "#{user_params.key?(:password) ? 'Password' : 'Profile'} successfully updated"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
  	@user = User.find(current_user).destroy
  	flash[:notice] = "Account deleted."
  	redirect_to root_path
  end

  private

  def update_user
    if user_params.key?(:password)
      @user.update_with_password user_params
    else
      @user.update_attributes user_params #update_attribute method skip the validations
    end
  end

  def user_params
     params.require(:user).permit(:email, :name, :current_password, :password, :password_confirmation)
  end
end
