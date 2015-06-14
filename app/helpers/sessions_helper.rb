module SessionsHelper
  def member_id
    session['warden.user.member.key'][0][0]
  end

  def log_out
    session.delete(:member_id)
    @current_member = nil
  end

  def current_member
    @current_member ||= Member.find_by(id: member_id)
  end

  def logged_in?
    !current_member.nil?
  end

end
