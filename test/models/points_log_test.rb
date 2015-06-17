# == Schema Information
#
# Table name: points_logs
#
#  id         :INTEGER          not null, primary key
#  reason     :varchar
#  change     :integer
#  team_id    :integer
#  member_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_points_logs_on_member_id  (member_id)
#  index_points_logs_on_team_id    (team_id)
#

require 'test_helper'

class PointsLogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
