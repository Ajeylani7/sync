Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  # Resources for posts
  resources :posts

  # Custom devise session routes
  devise_scope :user do
    get '/login', to: 'devise/sessions#new', as: 'login'
    post '/login', to: 'devise/sessions#create'
    delete '/logout', to: 'devise/sessions#destroy', as: 'logout'
  end
end
