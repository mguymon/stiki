require "stiki/engine"
require 'stiki/authenticate/devise'
require 'stiki/authorize/cancan'
require 'stiki/model/map_author'

module Stiki
  
    mattr_accessor :user_class
    mattr_accessor :user_name_via
    mattr_accessor :authenticate_by
    mattr_accessor :authenticate_pages
    mattr_accessor :authenticate_spaces
    mattr_accessor :auth_mapping
    mattr_accessor :authorize_by
    
    def self.reload
      config( &@@config_blk ) if @@config_blk
    end
    
    def self.config(&blk)
      @@config_blk = blk
      
      yield self
      
      if user_class
        unless @@user_name_via.nil?
          @@user_name_via = @@user_name_via.to_sym
        else
          @@user_name_via = :to_s
        end
        
        ::Stiki::Author.send(:include, Stiki::Model::MapAuthor)
      end
      
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
    
    module Helper      
      def self.user_model_name
        Stiki.user_class.constantize.name.underscore
      end
    end
end
