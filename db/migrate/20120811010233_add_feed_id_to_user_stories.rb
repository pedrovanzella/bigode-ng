class AddFeedIdToUserStories < ActiveRecord::Migration
  def change
    add_column :user_stories, :feed_id, :integer
  end
end
