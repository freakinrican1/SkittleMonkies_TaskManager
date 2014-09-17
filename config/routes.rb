TaskManager::Application.routes.draw do

  root to: 'users#new'

  get "email" => 'users#email', :as => "email"
  get "signup" => 'users#new', :as => "signup"
  post "create_user" => 'users#create', :as => "create_user"
  
  get "login" => 'logins#new', :as => "login"
  post "login" => 'logins#create', :as => "create_login"
  
  get "logout" => 'logins#destroy', :as => "logout"
  
  get "add_category" => 'categories#new', :as => "add_category"
  post "create_category" => 'categories#create', :as => "create_category"
  put "update" => 'categories#create', :as => "update"
  
  get "add_comment" => 'comments#new', :as => "new_comment"
  post "create_comment/:task_id" => 'comments#create', :as => "create_comment"

  match "project/:title" => 'projects#show', :as => "project"
  match "projects" => 'projects#index', :as => "projects"
  get "new_project" => 'projects#new', :as => "new_project"
  match "edit_project/:title" => 'projects#edit', :as => "edit_project"
  post "create_project" => 'projects#create', :as => "create_project"
  match "update_project/" => 'projects#update', :as => "update_project"
  match "delete_project/:title " => 'projects#destroy', :as => "delete_project"
  
  resources :tasks
end
