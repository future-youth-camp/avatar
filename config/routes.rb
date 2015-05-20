Rails.application.routes.draw do
  

  ActiveAdmin.routes(self)
  get 'teams/index'

  get 'backpack_content/index'

  get 'backpack_content/create'

  get 'backpack_content/new'

  root 'teams#index'
end
