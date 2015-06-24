class SessionsController < ApplicationController
  skip_before_action :authenticate_member!, :only => [:login, :create, :destroy]

  def login

  end

  def create
    puts "entered sessions create"
    auth = request.env["omniauth.auth"]
    member = Member.find_by_provider_and_uid(auth["provider"], auth["uid"])

    if member
      puts "trying to update name"
      puts auth["name"]
      Member.update_with_omniauth(member, auth)
      member = Member.find_by_provider_and_uid(auth["provider"], auth["uid"])
    else
      puts "create new member"
      member = Member.create_with_omniauth(auth)
    end
    # require 'pry'
    # binding.pry

    session[:member_id] = member.id
    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    puts "killing session"
    reset_session
    redirect_to root_url, :notice => "Signed out!"
  end
end
