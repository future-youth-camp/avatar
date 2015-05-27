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
#

class Team < ActiveRecord::Base
	has_many :backpack_contents
	has_many :members
	validates_presence_of :name
end
