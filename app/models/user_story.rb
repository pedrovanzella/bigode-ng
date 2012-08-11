class UserStory < ActiveRecord::Base
  attr_accessible :liked, :read, :stared, :story_id, :user_id, :feed_id, :subscription_id

  belongs_to :user
  belongs_to :story
  belongs_to :feed
  belongs_to :subscription
end
