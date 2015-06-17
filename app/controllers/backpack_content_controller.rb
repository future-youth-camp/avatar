class BackpackContentController < ApplicationController
  def index
    return redirect_to root_path if disallowed(params[:id])
    @team = Team.find_by(id: params[:id])
  end

  def create
    return redirect_to root_path if disallowed(params[:id])
    @team = Team.find_by(id: params[:id])
  end

  def new
    return redirect_to root_path if disallowed(params[:id])
    @team = Team.find_by(id: params[:id])
  end

  def disallowed(id)
    unless current_member.admin || current_member.team_id == id
      redirect_to teams_path
    end
  end
end
