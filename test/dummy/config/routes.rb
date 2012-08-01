Rails.application.routes.draw do

  mount ProjectMonster::Wiki::Engine => "/wiki"
end
