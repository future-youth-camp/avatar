ActiveAdmin.register PointsLog do
  permit_params :team_id, :change, :reason
  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs do
      input :team_id, input_html: { value: params[:team_id] }, as: :hidden
      input :member_id, input_html: { value: current_member.id }, as: :hidden
      input :change, label: "Poängförändring", placeholder: '-300'
      input :reason, label: "Varför?", placeholder: 'Nedskräpning'
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
end
