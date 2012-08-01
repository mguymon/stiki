module Stiki
  class Engine < ::Rails::Engine
    #isolate_namespace ProjectMonsterWiki
    
    mattr_accessor :user_class
  end
end
