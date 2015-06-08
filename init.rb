Redmine::Plugin.register :redmine_reminders do
  name 'Redmine Redminders plugin'
  description 'This plugin adds the ability to define reminders for important stuff'
  author 'Jean-Baptiste BARTH'
  author_url 'mailto:jeanbaptiste.barth@gmail.com'
  requires_redmine :version_or_higher => '2.1.0'
  version '0.0.2'
  url 'https://github.com/jbbarth/redmine_reminders'
  requires_redmine_plugin :redmine_base_rspec, :version_or_higher => '0.0.3' if Rails.env.test?
  requires_redmine_plugin :redmine_base_deface, :version_or_higher => '0.0.1'
  project_module :reminders do
    permission :view_reminders, { :reminders => [:index] }
    permission :manage_reminders, { :reminders => [:new, :create, :edit, :update, :destroy] }
  end
end
