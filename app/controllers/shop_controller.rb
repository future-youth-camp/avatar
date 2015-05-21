class ShopController < ApplicationController
  def new
    @team = team
    @items = Item.all
  end

  def create
    @team = team
    @item = Item.find_by(id: params[:item_id])
    @success = false
    if @item.cost < @team.points
	bc = BackpackContent.find_or_create_by(team_id: @team.id, item_id: @item.id)
	bc.amount = 1 + bc.amount.to_i
	@team.points = @team.points - @item.cost
	@team.save!
	bc.save!
	@success = true
    end
  end

  private

  def team
    Team.find_by(id: params[:team_id])
  end

end
