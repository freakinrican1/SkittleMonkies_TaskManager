TaskManager::Application.routes.draw do
  get "signup" => 'users#new', :as => "signup"
  get "users" => 'users#users'
end
