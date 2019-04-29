class Api::SongsController < ApplicationController

  def index
    render json: Song.all
  end

  def show 
      @song = Song.find(params[:id])
      if params[:resource]
        render json: @song.send(params[:resource])
      else
        render json: @song.as_json(except: [:created_at, :updated_at])
      end
  end

  #def rating 
    # rating = Rating.new(rating_params)
    #@rating = Rating.find(params[:id])  #realizar busqueda por id usuario que pone el rating
    # if rating.save
    #   redirect_to 
    # else
    #     render new
    # end
  #   @rating.songs << @songs
  # end

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
    params.require(:song).permit(:id, :rating)
  end

end
  