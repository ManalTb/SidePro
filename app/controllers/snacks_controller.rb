class SnacksController < ApplicationController
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
  	Snack.create brand: params[:brand], adress: params[:adress], category_id: params[:category_id]
  	redirect_to '/snacks'
  end

  def destroy
  Snack.find(params[:id]).destroy
  redirect_to "/snacks"
end
end
