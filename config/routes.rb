Rails.application.routes.draw do
  namespace :api do
    resources :songs, only: [:index, :show] do
      get ':resource', to: 'songs#index'
      patch 'progress', to: 'songs#update'
      get 'search', on: :collection
    end
    resources :artists, only: [:index, :show] do
      get ':resource', to: 'artists#index'
      get 'search', on: :collection
    end
    resources :albums, only: [:index,:show]  do
      get ':resource', to: 'albums#index'
      get 'search', on: :collection
    end
  end
  
  namespace :admin do
    resources :songs
  end
end
