class CreateStikiAuthors < ActiveRecord::Migration
  def change
    create_table :stiki_authors do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
