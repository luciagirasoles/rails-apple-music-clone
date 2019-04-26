class Admin::SongsController < ApplicationController
  before_action :set_songs, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
    authorize @songs
  end

  def new
    @song = Song.new
    authorize @song
  end

  def edit
    authorize @song    
  end
  
  def show
  end

  
  def create
    authorize @song
    @song = Song.new(song_params)
    if @song.save
      redirect_to admin_song_path(@song), notice: 'song was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize @song
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to admin_song_path(@song), notice: 'song was successfully updated.'
    else
      flash[:notice] = "This is not your song!"
      render :edit
    end
  end

  def destroy
    authorize @song
    @song.destroy
    redirect_to admin_songs_path, notice: 'song was successfully destroyed.'
  end

  private
  def set_songs
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title ,:description ,:rating ,:duration ,:price ,:status ,:progress, :cover)
  end
end
