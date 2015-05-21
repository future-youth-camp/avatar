# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_members_on_team_id  (team_id)
#

class Member < ActiveRecord::Base
	belongs_to :team
	validates_presence_of :email, :name, :team_id
end
