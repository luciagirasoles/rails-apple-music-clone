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

  def rating 
    # rating = Rating.new(rating_params)
    @rating = Rating.find(params[:id])  #realizar busqueda por id usuario que pone el rating
    # if rating.save
    #   redirect_to 
    # else
    #     render new
    # end
    @rating.songs << @songs
  end

  private

  def rating_params
    params.require(:song).permit(:id, :rating)
  end

end
  