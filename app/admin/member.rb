ActiveAdmin.register Member do
  permit_params :name, :email, :team_id
end
