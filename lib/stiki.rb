require "stiki/engine"
require 'stiki/authenticate/devise'
require 'stiki/authorize/cancan'

module Stiki
  
    mattr_accessor :user_class
    mattr_accessor :authenticate_by
    mattr_accessor :authenticate_pages
    mattr_accessor :authenticate_spaces
    mattr_accessor :auth_mapping
    
    mattr_accessor :authorize_by
    
    def self.reset
      @@authenticate_by = false
      @@authorize_by = false
      @@authenticate_pages = nil
      @@authenticate_spaces = nil
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
          
          @@authenticate_pagess = {:only => [:new, :create, :edit, :update]} if @@authenticate_pages.nil?
          @@authenticate_spaces = {:only => [:new, :create, :edit, :update]} if @@authenticate_spaces.nil?
          
          @@auth_mapping = { :pages => @@authenticate_pages, :spaces => @@authenticate_spaces }
          
          ::Stiki::SpacesController.send(:include, Stiki::Authenticate::Devise )
          
          ::Stiki::PagesController.send( :include, Stiki::Authenticate::Devise )
        end
        
      end
      
      if authorize_by 
        if authorize_by.to_sym == :cancan
          ::Stiki::SpacesController.send(:include, Stiki::Authorize::Cancan )
          
          ::Stiki::PagesController.send( :include, Stiki::Authorize::Cancan )
        end
      end
    end
end
