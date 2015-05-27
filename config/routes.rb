Rails.application.routes.draw do
  

  devise_for :members
  ActiveAdmin.routes(self)

  root 'teams#index'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :teams, only: [:index, :show]

  get 'shop/:team_id', to: 'shop#new', as: :shop
  post 'shop/:team_id', to: 'shop#create', as: :purchase

end
