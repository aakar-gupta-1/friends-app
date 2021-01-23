Rails.application.routes.draw do
  resources :friends
  # root 'home#index'
  root 'friends#index'
  get 'home/about'
  # Routes for Google authentication
  get 'auth/:google_oauth2/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
end
