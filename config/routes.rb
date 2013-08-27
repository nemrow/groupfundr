Groupfundr::Application.routes.draw do
  root :to => 'welcome#index'

  get 'sign_up', :to => 'users#new'

  resources :users
end
