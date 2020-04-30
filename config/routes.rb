Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'users#home'

  # Sign up
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  # Login
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  # Oauth
  get "/auth/:provider/callback", to: "sessions#create"
  
  delete '/logout' => 'sessions#destroy'

  get '/users/dashboard' => 'users#dashboard'

  # Users and Login
  resources :users, only: [:home, :show, :new, :create, :dashboard]
  resources :sessions, only: [:new, :create, :destroy]

  # Event Routes
  resources :events do 
    resources :reservations, only: [:index, :create]
    resources :reviews, only: [:index, :new, :create]
  end 

  post '/events/:id' => 'events#reserve'
  get '/recent_reviews' => 'reviews#recent_reviews'
  resources :reviews
  resources :reservations, only: [:destroy]
end
