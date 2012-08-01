module Stiki
  class Page < ActiveRecord::Base
    self.table_name = "stiki_pages"
    
    extend ::FriendlyId
    friendly_id :name, use: :slugged
    
    attr_accessible :body, :title
  end
end
