Rails.application.routes.draw do
  

  ActiveAdmin.routes(self)

  root 'teams#index'

  resources :teams, only: [:index, :show]

end
