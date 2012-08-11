class CreateUserStories < ActiveRecord::Migration
  def change
    create_table :user_stories do |t|
      t.integer :user_id
      t.integer :story_id
      t.boolean :read
      t.boolean :stared
      t.boolean :liked

      t.timestamps
    end
  end
end
