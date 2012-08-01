ProjectMonster::Wiki::Engine.routes.draw do
  namespace :project_monster do
    resources :authors
  
    resources :pages
  
    resources :spaces
  end
  root :to => 'project_monster::spaces#index'
  
end
