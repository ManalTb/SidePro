class SnacksController < ApplicationController
   before_filter :authenticate_user!, except: [:index, :show]

  def new
    @snack = Snack.new
  end

  def index
  	@snacks = Snack.page(params[:page]).per(6)
  	@categories = Category.all
  end

  def show
  	@snack = Snack.find(params[:id])
  end

  def edit
    @snack = Snack.find(params[:id])
  end

  def update
    @snack = Snack.find(params[:id])
    if @snack.update_attributes snack_params
      flash[:success] = "Snack successfully updated !"
  	  redirect_to @snack
    else
      render :edit
    end
  end

  def create
  	@snack = Snack.new snack_params
    if @snack.save
       flash[:success] = "Snack successfully created!"
      redirect_to action: :index
    else
      render :new
    end
  end

  def destroy
    Snack.find(params[:id]).destroy
       flash[:danger] = "Snack deleted :("
    redirect_to action: :index
  end

  private

  def snack_params
     params.require(:snack).permit(:brand, :adress, :category_id, :image)
  end
end
