Groupfundr::Application.routes.draw do
  get "campaigns/new"

  root :to => 'welcome#index'

  get 'sign_up', :to => 'users#new'
  get 'sign_in', :to => 'sessions#new'
  get 'sign_out', :to => 'sessions#destroy'
  get 'invitation/:invite_id', :to => 'invites#show'

  resources :users do
    resources :campaigns, :only => [:index]
  end
  resources :sessions, :only => [:create, :destroy]
  resources :campaigns do
    resources :invites, :only => [:create]
  end
  resources :invites, :only => [:show] do
    get 'accept'
  end 
end
