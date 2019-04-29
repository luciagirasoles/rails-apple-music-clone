Rails.application.routes.draw do
  root to: "admin/home#index"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  namespace :api do
    resources :songs, only: [:index, :show] do
      get ':resource', to: 'songs#index'
      patch 'progress', to: 'songs#update'
      get 'search', on: :collection
      patch 'rating', to: 'songs#rating'
    end
    resources :artists, only: [:index, :show] do
      get ':resource', to: 'artists#show'
      get 'search', on: :collection
    end
    resources :albums, only: [:index,:show]  do
      get ':resource', to: 'albums#show'
      get 'search', on: :collection
      patch 'rating', to: 'albums#rating'
    end
  end
  namespace :admin do
    root 'home#index'
    resources :songs
    resources :artists
    resources :albums do
      get "add_record", on: :member
      patch "save_record", on: :member
    end
  end
  resources :regulars
  resources :albums, only: [:index, :show] do
    post 'rating', on: :member
  end
  resources :artists, only: [:index, :show]
  resources :songs, only: [:index, :show] do
    post 'rating', on: :member
  end
end 
