Stiki::Engine.routes.draw do
  
  namespace :stiki do
    resources :authors
  
    resources :pages
  
    resources :spaces
  end
  root :to => 'stiki::spaces#index'
  
end
