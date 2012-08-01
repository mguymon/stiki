class CreateProjectMonsterWikiPages < ActiveRecord::Migration
  def change
    create_table :stiki_pages do |t|
      t.string :title
      t.text :body
      t.integer :parent_id
      t.integer :author_id

      t.timestamps
    end
  end
end
