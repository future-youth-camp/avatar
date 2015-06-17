class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def show
    if current_member.admin || current_member.team_id == params[:id]
      @team = Team.find(params[:id])
      render
    else
      return redirect_to teams_path
    end
  end
end
