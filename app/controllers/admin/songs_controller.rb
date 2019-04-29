class Admin::SongsController < ApplicationController
  before_action :set_songs, only: [:show, :edit, :update, :destroy, :rating]

  def index
    @songs = Song.all
    authorize @songs
  end

  def new
    @song = Song.new
  end

  def edit
    authorize @song    
  end
  
  def show
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

  
  def create

    @song = Song.new(song_params)
    @song = current_user.songs.create(song_params)

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
