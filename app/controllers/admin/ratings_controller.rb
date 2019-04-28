class Admin::RatingsController < ApplicationController
  def create
    @rating = Rating.new(rating_params)
    if @rating.save
      redirect_to[@rating.ratingable], notice: 'Rating created'
    else
      render :new
    end
  end

  private

  def rating_params
    params.require(:rating).permite(:user_id, :value, :ratingable_id, :ratingable_type)
  end
end
