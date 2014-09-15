TaskManager::Application.routes.draw do

  get "signup" => 'users#new', :as => "signup"
  post "create_user" => 'users#create', :as => "create_user"

  resources :tasks

end
