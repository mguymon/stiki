class CreateStikiAuthors < ActiveRecord::Migration
  def change
    create_table :stiki_authors do |t|
      t.integer :user_id
      t.integer :authorable_id
      t.string  :authorable_type
      t.boolean :creator
      t.timestamps
    end
    
    add_index :stiki_authors, [:authorable_id, :authorable_type]
  end
end
