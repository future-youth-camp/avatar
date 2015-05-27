# == Schema Information
#
# Table name: items
#
#  id         :INTEGER          not null, primary key
#  name       :varchar
#  image      :varchar
#  cost       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
