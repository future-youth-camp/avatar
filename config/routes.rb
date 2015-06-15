Rails.application.routes.draw do
  devise_for :members, path: 'auth', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'secret',
    confirmation: 'verification',
    unlock: 'unblock',
    registration: 'register',
    sign_up: 'cmon_let_me_in'
  }, controllers: { :registrations => "registrations" }
  ActiveAdmin.routes(self)

  root 'teams#index'
  resources :teams, only: [:index, :show]
  get 'shop/:team_id', to: 'shop#new', as: :shop
  post 'shop/:team_id', to: 'shop#create', as: :purchase
end
