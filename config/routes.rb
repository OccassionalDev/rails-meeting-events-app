Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'users#home'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  get '/auth/github/callback' => 'sessions#create'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/users/dashboard' => 'users#dashboard'

  resources :users, only: [:home, :show, :new, :create, :dashboard]
  resources :sessions, only: [:new, :create, :destroy]

  resources :events do 
    resources :reservations, only: [:index, :create, :destroy]
    resources :reviews, only: [:index, :new, :create]
  end 

  post '/events/:id' => 'events#reserve'

  resources :reviews
end
