require "cgi"
# == Schema Information
#
# Table name: members
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string
#  team_id                :integer
#  provider               :string
#  uid                    :string
#
# Indexes
#
#  index_members_on_email                 (email) UNIQUE
#  index_members_on_reset_password_token  (reset_password_token) UNIQUE
#  index_members_on_team_id               (team_id)
#
class Member < ActiveRecord::Base
  belongs_to :team

  def self.create_with_omniauth(auth)
    create! do |member|
      puts "creating new member"
      member.provider = CGI::escapeHTML(auth["provider"].force_encoding(Encoding::UTF_8))
      member.uid = auth["uid"]
      member.name = CGI::escapeHTML(auth["info"]["name"].force_encoding(Encoding::UTF_8))
      member.email = CGI::escapeHTML(auth["info"]["email"].force_encoding(Encoding::UTF_8))
      member.team_id = Team.admin_team_id if auth["extra"]["user_info"]["user"]["is_admin"]
    end
  end

  def self.update_with_omniauth(member, auth)
    name = CGI::escapeHTML(auth["info"]["name"].force_encoding(Encoding::UTF_8))
    member.update(name: name)
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
