
RedmineApp::Application.routes.draw do

  resources :projects do
    member do
      match 'rfb_project_settings', :via => [:get, :post]
    end
  end

  match '/projects/:project_id/file_bucket' => 'file_bucket#index', :via => [:get], :as => 'file_bucket'

end

