class UsersController < ApplicationController
  before_action :authenticate_user!
  
def index
	@all_users = User.all
end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:success] = "User was successfully created !"
  		redirect_to "/users"
  	else
  		render :new
  	end
  end

  def show
  	@user = User.find(params[:id])
  end
end
