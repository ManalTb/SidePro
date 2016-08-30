class RatingsController < ApplicationController
    before_filter :authenticate_user!

    before_filter :get_snack

  def new
    @rating = @snack.ratings.new
  end

  def create
    @rating = @snack.ratings.new rating_params
    if @rating.save
      flash[:success] = "Rate successfully created"
      redirect_to snacks_path(page: params[:page])
    else
      render :new
    end
  end


  def edit
    @rating = @snack.ratings.find(params[:id])
  end

  def update

    @rating = @snack.ratings.find(params[:id])
    if @rating.update_attributes rating_params
      flash[:success] = "Rate successfully updated"
      redirect_to snacks_path(page: params[:page])
    else
      render :edit
    end
  end

  private

    def rating_params
      params.require(:rating).permit(:mark).update(user: current_user)
    end

    def get_snack
      @snack =  Snack.find(params[:snack_id])
    end
end
