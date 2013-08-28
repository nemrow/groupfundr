Groupfundr::Application.routes.draw do
  get "campaigns/new"

  root :to => 'welcome#index'

  get 'sign_up', :to => 'users#new'
  get 'sign_in', :to => 'sessions#new'
  get 'sign_out', :to => 'sessions#destroy'

  resources :users do
    resources :campaigns, :only => [:index]
  end
  resources :sessions, :only => [:create, :destroy]
  resources :campaigns do
    resources :invites, :only => [:create]
  end
end
