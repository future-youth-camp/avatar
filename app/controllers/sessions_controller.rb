class SessionsController < ApplicationController
  helper :sessions
  def new
  end

  def create
    member = Member.find_by(email: params[:session][:email].downcase)
    if member && member.authenticate(params[:session][:password])
      log_in member
      redirect_to root_path
    else
      flash[:error] =  "Felaktigt lösenord eller epostadress"
      render 'new'
    end
  end

  def destroy
    SessionsHelper::log_out
    redirect_to root_path
  end

end
