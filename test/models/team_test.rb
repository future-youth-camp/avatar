# == Schema Information
#
# Table name: teams
#
#  id         :INTEGER          not null, primary key
#  name       :varchar
#  points     :integer
#  color      :varchar
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  admin      :boolean          default(FALSE)
#

require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
