class Admin::ArtistsController < ApplicationController
  
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  def index
    @artists = Artist.all
    authorize @artists
  end

  def new
    @artist = Artist.new
    authorize @artist
  end

  def edit
  end

  def show
  end

  def create
    authorize @artist
    @artist = Artist.new(artists_params)
    if @artist.save
      redirect_to admin_artist_path(@artist), notice: 'artist was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize @artist
    if @artist.update(artists_params)
      redirect_to admin_artist_path(@artist), notice: 'artist was successfully updated.'
    else
      flash[:notice] = "This specific artist is not yours!"
      render :edit
    end
  end

 
  def destroy
    authorize @artist
    @artist.destroy
    redirect_to admin_artists_path, notice: 'artist was successfully destroyed.'
  end

  private
  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artists_params
    params.require(:artist).permit(:name ,:age, :cover)
  end
end