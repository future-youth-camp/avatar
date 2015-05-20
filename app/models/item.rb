# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string
#  image      :string
#  cost       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Item < ActiveRecord::Base
end
