Microfunder::Application.routes.draw do

  get 'tags/:tag', to: 'projects#index', as: :tag

  root :to => 'projects#index'
  
  resources :projects
  resources :users
  resources :user_sessions, :only => [:new, :create, :destroy]
  
  resources :projects do
  	resources :donations, :except => [:index, :destroy, :edit]
  end

  get 'login' => 'user_sessions#new', :as => :login
  get 'logout' => 'user_sessions#destroy', :as => :logout
end
