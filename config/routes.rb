Microfunder::Application.routes.draw do
  get "user_sessions/new"
  get "user_sessions/create"
  get "user_sessions/destroy"
  resources :projects
  resources :users
  resources :user_sessions

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
