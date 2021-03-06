class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_member!
  helper_method :current_member
  helper_method :member_signed_in?

  private
  def current_member
    @current_member ||= Member.find(session[:member_id]) if session[:member_id]
  end

  def member_signed_in?
    return false if current_member.blank?
    true
  end

  def authenticate_member!
    redirect_to login_path if current_member.nil?
  end


end
