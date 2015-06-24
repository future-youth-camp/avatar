Rails.application.routes.draw do
  get '/login', to: 'sessions#login', as: :login
  match "/auth/:provider/callback", to: "sessions#create", via: [:get, :post]
  match "/signout", to: "sessions#destroy", :as => :signout, via: [:get, :post, :delete]
  ActiveAdmin.routes(self)

  root 'teams#index'
  resources :teams, only: [:index, :show]
  get 'shop/:team_id', to: 'shop#new', as: :shop
  post 'shop/:team_id', to: 'shop#create', as: :purchase

end
