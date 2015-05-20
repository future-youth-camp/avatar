# == Schema Information
#
# Table name: backpack_contents
#
#  id         :integer          not null, primary key
#  number     :integer
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

require 'test_helper'

class BackpackContentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
