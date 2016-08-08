class RatingsController < ApplicationController
    before_filter :authenticate_user!

  def new
    @rating = Rating.new snack_id: params[:snack_id]
  end

  def create
    @rating = Rating.new rating_params
    if @rating.save
      flash[:success] = "Rate successfully created"
      redirect_to snacks_path
    else
      render :new
    end
  end

  def edit
    @rating = Rating.find(params[:id])
  end

  def update
    @rating = Rating.find(params[:id])
    if @rating.update_attributes rating_params
      flash[:success] = "Rate successfully updated"
    else
      render :edit
    end
  end

  private
    def rating_params
      params.require(:rating).permit(:mark, :snack_id, current_user)
    end
end
