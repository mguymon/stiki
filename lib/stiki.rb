require "stiki/engine"
require 'stiki/authenticate/devise'

module Stiki
  
    mattr_accessor :user_class
    mattr_accessor :authenticate_by
    mattr_accessor :authenticate_pages_actions
    mattr_accessor :authenticate_spaces_actions
    mattr_accessor :auth_mapping
    
    def self.reset
      @@authenticate_by = false
      @@authenticate_pages_actions = nil
      @@authenticate_spaces_actions = nil
      @@auth_mapping = {}
    end
    Stiki.reset()
    
    def self.config(&blk)
      
      yield self
      
      if authenticate_by
        
        if authenticate_by.to_sym == :devise
          
          if user_class.nil?
            raise "Stiki.user_class is required for devise auth"
          end
          
          @@authenticate_pages_actions = {:only => [:new, :create, :edit, :update]} if @@authenticate_pages_actions.nil?
          @@authenticate_spaces_actions = {:only => [:new, :create, :edit, :update]} if @@authenticate_spaces_actions.nil?
          
          @@auth_mapping = { :pages => @@authenticate_pages_actions, :spaces => @@authenticate_spaces_actions }
          
          ::Stiki::SpacesController.send(:include, Stiki::Authenticate::Devise )
          
          ::Stiki::PagesController.send( :include, Stiki::Authenticate::Devise )
        end
        
      end
    end
end
