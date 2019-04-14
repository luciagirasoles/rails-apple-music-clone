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
  def update
    @song = Song.find(params[:song_id])
    @song[:progress] = params[:progress]
    @song.save
    render json: @song.as_json(only:['progress'])
  end

  def search
    @song = Song.search(params[:search])
    if @song.empty?
      render json: @song, status: :not_found
    else
      render json: @song.as_json(except: [:id, :created_at, :updated_at])
    end
  end


  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { message: e.message }, status: :not_found
  end
end
