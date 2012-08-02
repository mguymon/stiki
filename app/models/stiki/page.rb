require 'friendly_id'

module Stiki
  class Page < ActiveRecord::Base
    self.table_name = "stiki_pages"
    
    extend ::FriendlyId
    friendly_id :title, use: :slugged
    
    belongs_to :space
    
    attr_accessible :body, :title
    
    validates :title, :uniqueness => {:scope => :space_id}, :presence => true
    validates :body, :presence => true
  end
end
