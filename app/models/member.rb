# == Schema Information
#
# Table name: members
#
#  id                     :INTEGER          not null, primary key
#  email                  :varchar          default(""), not null
#  encrypted_password     :varchar          default(""), not null
#  reset_password_token   :varchar
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :varchar
#  last_sign_in_ip        :varchar
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :varchar
#  team_id                :integer
#  provider               :varchar
#  uid                    :varchar
#
# Indexes
#
#  index_members_on_email                 (email) UNIQUE
#  index_members_on_reset_password_token  (reset_password_token) UNIQUE
#  index_members_on_team_id               (team_id)
#

class Member < ActiveRecord::Base
  belongs_to :team
#  validates_presence_of :email, :name, :team_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:slack]

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |member|
        member.provider = auth.provider
        member.uid = auth.uid
        member.email = auth.info.email
        member.password = Devise.friendly_token[0,20]
      end
      puts "-SUCCESS-SUCCESS-SUCCESS-SUCCESS-SUCCESS-SUCCESS-"
      puts member
  end

  def team
    t = Team.find_by(id: team_id)
    t = Team.new(name: 'Inget', color: 'red', admin: false) if t.nil?
    t
  end

  def admin
    team.admin
  end

end
