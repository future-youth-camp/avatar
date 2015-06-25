ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        button_to("Tillbaka till webbsidan", root_path, method: :get)
      end
    end

#    Here is an example of a simple dashboard with columns and panels.
    columns do
      column do
        panel "Alla användare" do
          Member.all.map do |member|
            columns do
              column do
                link_to(member.name, edit_admin_member_path(member))
              end
              column do
                para member.team.name
              end
            end
          end
        end
      end


      column do
        panel "Alla lag" do
          Team.all.map do |team|
            columns do
              column do
                link_to(team.name, edit_admin_team_path(team))
              end
              column do
                link_to("Ändra poäng", new_admin_points_log_path(team_id:team.id))
              end
            end
          end
          div do
            button_to("Skapa lag", new_admin_team_path, method: :get)
          end
        end # panel
      end # column
    end
  end # content
end
