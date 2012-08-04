module Stiki
  class Space < ActiveRecord::Base
    self.table_name = "stiki_spaces"
    
    extend ::FriendlyId
    friendly_id :name, use: :slugged
    
    has_many :pages
    belongs_to :author
    
    attr_accessible :name
    
    validates :name, :uniqueness => true, :presence => true
  end
end
