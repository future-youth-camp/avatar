class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def show 
    @team = Team.find(team_id)
  end

  private

  def team_id
    params[:id]
  end
end
