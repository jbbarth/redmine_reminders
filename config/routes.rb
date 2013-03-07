RedmineApp::Application.routes.draw do
  resources :reminders, :except => :show
end
