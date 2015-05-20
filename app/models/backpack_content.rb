# == Schema Information
#
# Table name: backpack_contents
#
#  id         :integer          not null, primary key
#  amount     :integer
#  team_id    :integer
#  item_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_backpack_contents_on_item_id  (item_id)
#  index_backpack_contents_on_team_id  (team_id)
#

class BackpackContent < ActiveRecord::Base
  belongs_to :team
  belongs_to :item
end
