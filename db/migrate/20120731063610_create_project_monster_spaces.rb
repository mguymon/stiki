class CreateProjectMonsterWikiSpaces < ActiveRecord::Migration
  def change
    create_table :project_monster_spaces do |t|
      t.string :name

      t.timestamps
    end
  end
end
