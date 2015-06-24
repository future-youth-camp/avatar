class ShopController < ApplicationController
  def new
    return redirect_to root_path if disallowed
    @team = team
    @items = Item.all
  end

  def create
    return redirect_to root_path if disallowed
    @team = team
    @item = Item.find_by(id: params[:item_id])
    @success = false
    if @item.cost <= @team.points
      bc = BackpackContent.find_or_create_by(
        team_id: @team.id,
        item_id: @item.id
      )
      pl = PointsLog.create(
        reason: "köpte #{@item.name} för ",
        change: 0 - @item.cost,
        team_id: @team.id,
        member_id: current_member.id
      )
      bc.amount = 1 + bc.amount.to_i
      @team.points = @team.points - @item.cost
      @team.save!
      bc.save!
      @success = true
      redirect_to team_path(@team)
    end
  end

  private

  def team
    Team.find_by(id: params[:team_id])
  end

  def disallowed
    unless current_member.admin || current_member.team_id == params[:team_id]
      redirect_to teams_path
    end
  end
end
