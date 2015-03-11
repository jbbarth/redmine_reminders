Deface::Override.new :virtual_path  => "issues/index",
                     :name          => "add-new-reminder-link-to-issues",
                     :original      => "bc6ae6262eef79aab70c151bfacde1eb8e66512f",
                     :insert_top    => "div.contextual" do
  %(
    <% content_for :header_tags do %>
      <%= stylesheet_link_tag "reminders", :plugin => "redmine_reminders" %>
    <% end %>
    <%= link_to l(:label_reminder_add), new_reminder_path(:back_url => issues_path),
                :class => "icon icon-reminder",
                :id => "new-reminder" if User.current.allowed_to?(:manage_reminders, nil, :global => true) %>
  )
end

Deface::Override.new :virtual_path  => "issues/index",
                     :name          => "add-visible-reminders-on-issues",
                     :original      => "78c1f1aeece8df938d731e6cc8561d73839a508b",
                     :insert_before => "div.contextual",
                     :partial       => "reminders/boxes"
