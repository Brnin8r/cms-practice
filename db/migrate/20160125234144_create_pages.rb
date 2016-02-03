class CreatePages < ActiveRecord::Migration
  def up
    create_table :pages do |t|
      t.integer "subject_id"

      t.string "name", :limit => 30
      t.string "permalink"
      t.integer "position"
      t.boolean "visible", :default => false

      t.timestamps null: false
    end
    #Foreign key to connect to the subject table
    add_index("pages", "subject_id")
    add_index("pages", "permalink")
  end
  def down
    drop_table :pages
  end
end
