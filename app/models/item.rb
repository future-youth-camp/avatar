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

class Item < ActiveRecord::Base
	has_many :backpack_contents
end
