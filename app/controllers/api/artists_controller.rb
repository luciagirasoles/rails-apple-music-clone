class Api::ArtistsController < ApplicationController
  def index
    render json: Artist.all
  end

end
