TaskManager::Application.routes.draw do

  get "signup" => 'users#new', :as => "signup"
  post "create_user" => 'users#create', :as => "create_user"
  
  get "login" => 'logins#new', :as => "login"
  post "login" => 'logins#create', :as => "create_login"
  
  get "logout" => 'logins#destroy', :as => "logout"
  
  get "add_category" => 'categories#new', :as => "add_category"
  post "create_category" => 'categories#create', :as => "create_category"
  
  resources :tasks

end
