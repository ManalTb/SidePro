class SnacksController < ApplicationController
  before_filter :authenticate_user!, only: :create

  def new
    @snack = Snack.new
  end

  def index
  	@all_snacks = Snack.all
  	@all_categories = Category.all
  end

  def show
  	@onesnack = Snack.find(params[:id])
  end

  def update
  	@onesnack = Snack.find(params[:id])
  	@onesnack.brand = (params[:brand])
  	@onesnack.adress = (params[:adress])
  	@onesnack.save
  	redirect_to "/snacks/#{params[:id]}"
  end

  def create

  	@snack = Snack.new snack_params
    if @snack.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def destroy
    Snack.find(params[:id]).destroy
    redirect_to "/snacks"
  end

  private

  def snack_params    
     params.require(:snack).permit(:brand, :adress, :category_id)
  end
end

