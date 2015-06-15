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

class Team < ActiveRecord::Base
	has_many :backpack_contents
	has_many :members
	validates_presence_of :name
  before_save :set_default_details

  def set_default_details
    self.admin ||= false
    self.points ||= 0
  end
end
