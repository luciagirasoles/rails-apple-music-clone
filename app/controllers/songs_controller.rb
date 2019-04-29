class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
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
    redirect_to songs_path
  end
end