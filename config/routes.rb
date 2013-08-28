Groupfundr::Application.routes.draw do
  root :to => 'welcome#index'

  get 'sign_up', :to => 'users#new'
  get 'sign_in', :to => 'sessions#new'
  get 'sign_out', :to => 'sessions#destroy'

  resources :users
  resources :sessions, :only => [:create, :destroy]
end
