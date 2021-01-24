Rails.application.routes.draw do
  resources :friends
  # root 'home#index'
  root 'friends#index'
  get 'home/about'
  # Routes for Google authentication
  get 'users/auth/google_oauth2/callback', to: 'sessions#googleAuth'
  get 'users/auth/failure', to: redirect('/')
  devise_for :users
end
