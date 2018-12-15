module PhrasingHelper
  def can_edit_phrases?
    # member_signed_in? && current_member.admin
    true
  end
end
