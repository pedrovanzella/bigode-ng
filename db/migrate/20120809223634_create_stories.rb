class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :url
      t.string :author
      t.text :summary
      t.text :content
      t.date :published

      t.timestamps
    end
  end
end
