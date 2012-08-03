require "stiki/engine"
require 'stiki/auth'
require 'stiki/auth/devise'

module Stiki
  
    mattr_accessor :user_class
    mattr_accessor :auth
    mattr_accessor :auth_pages_actions
    mattr_accessor :auth_spaces_actions
    mattr_accessor :auth_mapping
    
    def self.reset
      @@auth = false
      @@auth_pages_actions = [:new, :create, :edit, :update]
      @@auth_spaces_actions = [:new, :create, :edit, :update]
      @@auth_mapping = {}
    end
    Stiki.reset()
    
    def self.config(&blk)
      
      yield self
      
      if auth
        
        if auth.to_sym == :devise
          @@auth_mapping = { :pages => @@auth_pages_actions, :spaces => @@auth_spaces_actions }
          
          Rails.logger.info( "ARRRRG #{Stiki.auth_mapping.inspect}")
          ::Stiki::SpacesController.send(:include, Stiki::Auth::Devise )
          
          ::Stiki::PagesController.send( :include, Stiki::Auth::Devise )
        end
        
      end
    end
end
