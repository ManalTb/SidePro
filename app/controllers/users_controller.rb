class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = current_user
  end

  def update
  	@user = User.find(current_user.id)
  	if @user.update_with_password user_params
  		flash[:success] = "Account successfully updated"
  		redirect_to user_path
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

  def user_params    
     params.require(:user).permit(:email, :name, :current_password, :password, :password_confirmation)
  end
end