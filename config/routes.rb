Microfunder::Application.routes.draw do
  root :to => 'projects#index'
  resources :projects
  resources :users
  resources :user_sessions, :only => [:new, :create, :destroy]

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
