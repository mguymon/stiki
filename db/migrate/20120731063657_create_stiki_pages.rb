class CreateStikiPages < ActiveRecord::Migration
  def change
    create_table :stiki_pages do |t|
      t.string :title
      t.string :slug
      t.text :body
      t.integer :parent_id
      t.integer :author_id
      t.integer :space_id

      t.timestamps
    end
  end
end
