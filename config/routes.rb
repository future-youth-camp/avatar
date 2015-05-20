Rails.application.routes.draw do
  

  ActiveAdmin.routes(self)

  root 'teams#index'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :teams, only: [:index, :show]

end
