Microfunder::Application.routes.draw do
  root :to => 'projects#index'
  resources :projects
  resources :users
  resources :user_sessions, :only => [:new, :create, :destroy]
  resources :projects do
  	resources :donations, :except => [:index, :destroy, :edit]
end
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
