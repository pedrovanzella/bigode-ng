class AddSubscriptionIdToUserStories < ActiveRecord::Migration
  def change
    add_column :user_stories, :subscription_id, :integer
  end
end
