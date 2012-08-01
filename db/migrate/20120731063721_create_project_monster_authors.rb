class CreateProjectMonsterWikiAuthors < ActiveRecord::Migration
  def change
    create_table :project_monster_authors do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
