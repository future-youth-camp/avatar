# == Schema Information
#
# Table name: members
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  team_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_members_on_team_id  (team_id)
#

class Member < ActiveRecord::Base
	belongs_to :team
	has_secure_password
end
