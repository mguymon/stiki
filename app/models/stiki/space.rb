module Stiki
  class Space < ActiveRecord::Base
    set_table_name "stiki_spaces"
    attr_accessible :name
  end
end
