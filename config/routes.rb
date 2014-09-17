TaskManager::Application.routes.draw do


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
  
  resources :tasks
  resources :projects

end
