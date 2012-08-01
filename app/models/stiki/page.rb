module Stiki
  class Page < ActiveRecord::Base
    set_table_name "stiki_pages"
    attr_accessible :body, :title
  end
end
