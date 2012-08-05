require 'friendly_id'

Stiki::Engine.routes.draw do 
  
  match "spaces/:space_id" => "stiki::pages#index"
  
  resources :authors, :controller => 'stiki::authors'
  
  resources :spaces, :controller => 'stiki::spaces' do
    resources :pages, :controller => 'stiki::pages'    
  end
  
  root :to => 'stiki::spaces#index'
  
end
