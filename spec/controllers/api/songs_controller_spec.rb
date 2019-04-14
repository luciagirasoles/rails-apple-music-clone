require 'rails_helper'

RSpec.describe Api::SongsController, type: :controller do
  
  before do
    @artist_1 = Artist.create(
      name: "Artist 1",
      age: 12
    )
    @song_1 = Song.create(
      title: "Song 1",
      duration: 60,
      rating: 1,
      progress: 1
    )
    @album = Album.create(
      title: "Title - 1",
      rating: 2
    )
    @album.artists << @artist_1
    @album.songs << @song_1
  end

  # List of songs
  describe 'GET index' do
    it 'returns http status ok' do
      get :index
      expect(response).to have_http_status(:ok)
    end
    it 'render json with all songs' do
      get :index
      songs = JSON.parse(response.body)
      expect(songs.size).to eq 1
    end
    it 'returns http status ok when get one album data' do
      get :index, params: {id: @song_1.id}
      expect(response).to have_http_status(:ok)
    end
  end

  # Song's details
  describe 'GET show' do
    it 'returns http status ok' do
      get :show, params: { id: @song_1 }
      expect(response).to have_http_status(:ok)
    end
    it 'render the correct song' do
      get :show, params: { id: @song_1 }
      expected_song = JSON.parse(response.body)
      expect(expected_song["id"]).to eq(@song_1.id)
    end
    it 'returns http status not found' do
      get :show, params: { id: 'xxx' }
      expect(response).to have_http_status(:not_found)
    end
  end
#show artist for album
  # Show artists for song
  describe 'GET show artists for song' do
    it 'returns http status ok' do
      get :show, params: { 
        id: @song_1.id,
        resource: "artists"
      }
      expect(response).to have_http_status(:ok)
    end
    it 'returns http status not found' do
      get :show, params: { 
        id: 'xxx',
        resource: "artists"
      }
      expect(response).to have_http_status(:not_found)
    end
  end

  # Show songs for album
  describe 'GET show songs for album' do
    it 'returns http status ok' do
      get :show, params: { 
        id: @song_1.id,
        resource: "albums"
      }
      expect(response).to have_http_status(:ok)
    end
    it 'render the correct album' do
      get :show, params: { 
        id: @song_1.id,
        resource: "albums"
      }
      expected_song = JSON.parse(response.body)
      expect(expected_song.size).to eq(1)
    end
    it 'returns http status not found' do
      get :show, params: { 
        id: 'xxx',
        resource: "albums"
      }
      expect(response).to have_http_status(:not_found)
    end
  end

  # Search songs
  describe 'GET search songs' do
    it 'returns http status ok' do
      get :search, params: { 
        search: @song_1.title
      }
      expect(response).to have_http_status(:ok)
    end
    it 'render the correct search' do
      get :search, params: { 
        search: @song_1.title
      }
      expected_song = JSON.parse(response.body)
      expect(expected_song.size).to eq(1)
    end
  end
  describe "PATCH update" do
    it "returns http status ok" do
      patch :update, params: {progress: 10, song_id: @song_1.id}
      expect(response).to have_http_status(:ok)
    end
    
    it "returns the updated progress" do
      patch :update, params: {progress: 10, song_id: @song_1.id}
      parsed_response = JSON.parse response.body
      expect(parsed_response["progress"]).to eq(10)
    end
  end

end