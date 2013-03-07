RedmineApp::Application.routes.draw do
  resources :reminders, :except => :index
end
