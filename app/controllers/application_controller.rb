class ApplicationController < ActionController::Base
  helper :sessions
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_member!

  # if devise_mapping.confirmable? && resource.pending_reconfirmation?
  #   flash[:notice] = "Currently waiting confirmation for: #{resource.unconfirmed_email}"
  # end
end
