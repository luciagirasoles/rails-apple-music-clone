class Admin::AlbumsController < ApplicationController
  before_action :set_albums, only: [:show, :edit, :update, :destroy, :add_record, :save_record]

  def index
    @albums = Album.all
    authorize @albums
  end

  def new
    @album = Album.new
    authorize @album
  end

  def edit
    authorize @album
  end
  
  def show
  end

  def rating
    @album = Album.find(params[:id])
    if !@album.ratings.where(user_id: current_user.id).any?
      @album.ratings.create(value: params[:rating], user_id: current_user.id)
      flash[:notice] = "Added to favorite albums" if params[:rating].to_i == 1
    else
      @rating = @album.ratings.where(user_id: current_user.id).first
      if @rating.value == params[:rating].to_i
        @rating.destroy
        flash[:notice] = "Remove from favorite albums" if params[:rating].to_i == 1
      else
        @rating.value = @rating.value * -1
        @rating.save
      end
    end
    redirect_to albums_path
  end

  def add_record
  end

  def save_record
    authorize @album
    @artist = Artist.find(params[:album][:artist_ids])
    @song = Song.find(params[:album][:song_ids])
    @album.songs << @song
    @album.artists << @artist
    @artist.songs << @song
    redirect_to admin_albums_path, notice: "Song and artist were added to the #{@album.title}"
  end
  
  def create
    authorize @album
    @album = Album.new(albums_params)
    if @album.save
      redirect_to admin_album_path(@album), notice: 'Album was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize @album
    @album = Album.find(params[:id])
    if @album.update(albums_params)
      redirect_to admin_album_path(@album), notice: 'Album was successfully updated.'
    else
      flash[:notice] = "This album doesn't belong to you!"
      render :edit
    end
  end

  def destroy
    authorize @album
    @album.destroy
    redirect_to admin_albums_path, notice: 'Album was successfully destroyed.'
  end

  private
  def set_albums
    @album = Album.find(params[:id])
  end

  def albums_params
    params.require(:album).permit(:title, :cover)
  end
end
