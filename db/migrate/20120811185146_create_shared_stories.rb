class CreateSharedStories < ActiveRecord::Migration
  def change
    create_table :shared_stories do |t|
      t.integer :story_id
      t.integer :user_id
      t.text :note

      t.timestamps
    end
  end
end
