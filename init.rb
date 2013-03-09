Redmine::Plugin.register :redmine_reminders do
  name 'Redmine Redminders plugin'
  description 'This plugin adds the ability to define reminders for important stuff'
  author 'Jean-Baptiste BARTH'
  author_url 'mailto:jeanbaptiste.barth@gmail.com'
  requires_redmine :version_or_higher => '2.1.0'
  version '0.0.1'
  url 'https://github.com/jbbarth/redmine_reminders'
  project_module :reminders do
    permission :view_reminders, { :reminders => [:index] }
    permission :manage_reminders, { :reminders => [:new, :create, :edit, :update, :destroy] }
  end
end

# Little hack for using the 'deface' gem in redmine:
# - redmine plugins are not railties nor engines, so deface overrides in app/overrides/ are not detected automatically
# - deface doesn't support direct loading anymore ; it unloads everything at boot so that reload in dev works
# - hack consists in adding "app/overrides" path of the plugin in Redmine's main #paths
# TODO: see if it's complicated to turn a plugin into a Railtie or find something a bit cleaner
Rails.application.paths["app/overrides"] ||= []
Rails.application.paths["app/overrides"] << File.expand_path("../app/overrides", __FILE__)
