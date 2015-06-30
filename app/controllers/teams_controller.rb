class TeamsController < ApplicationController
  skip_before_action :authenticate_member!, :only => [:index]
  def index
    @teams = Team.all
  end

  def show
    if current_member.admin || current_member.team_id == params[:id].to_i
      @team = Team.find(params[:id])
      render
    else
      return redirect_to teams_path
    end
  end
end
