class Admin::RatingsController < ApplicationController
  def create
    @rating = Rating.new(rating_params)
    if @rating.save
      redirect_to[@rating.ratingable], notice: 'Rating created'
    else
      render :new
    end
  end

  def rating
    @song = Song.find(params[:id])
    if !@song.ratings.where(user_id: current_user.id).any?
      @song.ratings.create(value: params[:rating], user_id: current_user.id)
      flash[:notice] = "Added to favorite songs" if params[:rating].to_i == 1
    else
      @rating = @song.ratings.where(user_id: current_user.id).first
      if @rating.value == params[:rating].to_i
        @rating.destroy
        flash[:notice] = "Remove from favorite songs" if params[:rating].to_i == 1
      else
        @rating.value = @rating.value * -1
        @rating.save
      end
    end
    redirect_to songs_path(@song), notice: 'You already voted!'
  end

  private

  def rating_params
    params.require(:rating).permite(:user_id, :value, :ratingable_id, :ratingable_type, :rating)
  end
end
