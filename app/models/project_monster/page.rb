module ProjectMonster
  class Page < ActiveRecord::Base
    set_table_name "project_monster_pages"
    attr_accessible :body, :title
  end
end
