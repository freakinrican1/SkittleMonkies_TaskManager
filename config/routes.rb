TaskManager::Application.routes.draw do

  get "signup" => 'users#new', :as => "signup"
  post "create_user" => 'users#create', :as => "create_user"
  
  get "login" => 'logins#new', :as => "login"
  post "login" => 'logins#create', :as => "create_login"
  
  get "logout" => 'logins#destroy', :as => "logout"
  
  get "add_category" => 'categories#new', :as => "add_category"
  post "create_category" => 'categories#create', :as => "create_category"
  put "update" => 'categories#create', :as => "update"
  
  match "project/:title" => 'projects#show', :as => "project"
  match "projects" => 'projects#index', :as => "projects"
  match "new_project" => 'projects#new'
  match "edit_project/:title" => 'projects#edit'
  match "create_project/:title" => 'projects#create'
  match "update_project/:title" => 'projects#update'
  match "delete_project/:title " => 'projects#destroy'
  
  resources :tasks
  
end
