require 'rails_helper'
describe Api::ArtistsController do
  before do
    @artist = Artist.create(name: "Nujabes", age: "31")
  end

  describe 'GET' do
    it 'returns http status ok' do
      get :index
      expect(response).to have_http_status(:ok)
    end
    it 'returns http status ok when get one movie data' do
      get :index, params: {id: @artist.id}
      expect(response).to have_http_status(:ok)
    end
  end

end