module Stiki
  class Space < ActiveRecord::Base
    self.table_name = "stiki_spaces"
    
    extend ::FriendlyId
    friendly_id :name, use: :slugged
    
    has_many :pages
    has_many :authors, :as => :authorable
    has_one :creator, :class_name => 'Author', :conditions => "creator = true", :as => :authorable
    
    attr_accessible :name
    
    validates :name, :uniqueness => true, :presence => true
  end
end
