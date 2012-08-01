module ProjectMonsterWiki
  class Space < ActiveRecord::Base
    set_table_name "project_monster_spaces"
    attr_accessible :name
  end
end
