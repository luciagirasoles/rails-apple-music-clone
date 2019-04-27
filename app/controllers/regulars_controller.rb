class RegularsController < ApplicationController

  def index
    @songs = current_user.songs
    @artists = current_user.artists 
    @albums = current_user.albums
  end

end