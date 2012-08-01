class CreateProjectMonsterWikiSpaces < ActiveRecord::Migration
  def change
    create_table :stiki_spaces do |t|
      t.string :name

      t.timestamps
    end
  end
end
