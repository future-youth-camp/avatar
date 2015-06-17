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
  after_create :init_points_log
  DEFAULT_POINTS = 1000

  def set_default_details
    self.color ||= '#000'
    self.admin ||= false
    self.points ||= DEFAULT_POINTS
  end

  def points_log
    result = PointsLog.where(team_id: id).limit(5)
    return [result] if result.instance_of? PointsLog
    return [] if result.nil?
    result
  end

  def init_points_log
    PointsLog.create(
      team_id: id,
      member_id: nil,
      reason: 'Startpott',
      change: DEFAULT_POINTS
    )
  end
end
