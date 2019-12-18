ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do

    # Here is an example of a simple dashboard with columns and panels.
    #
     columns do
       column do
         panel "Recent Feed" do
           ul do
              # Feed.recent(1).map do |feed|
              #  li link_to(feed.text, admin_post_path(feed))
              # end
              Feed.all.map do |feed|
               li link_to(feed.text)#, admin_post_path(feed))
              end
           end
         end
       end

    #   columns do
    #    panel "Info" do
    #     para "Welcome to ActiveAdmin."
    #    end
    #   end
     end
  end # content
end
