Microfunder::Application.routes.draw do

  # get "oauths/oauth"
  # get "oauths/callback"
  get 'tags/:tag', to: 'projects#index', as: :tag

  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

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
