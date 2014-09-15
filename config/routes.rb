TaskManager::Application.routes.draw do

  get "signup" => 'users#new', :as => "signup"
  post "create_user" => 'users#create', :as => "create_user"
  
  get "login" => 'logins#new', :as => "login"
  post "login" => 'logins#create', :as => "create_login" 
  
  resources :tasks

end
