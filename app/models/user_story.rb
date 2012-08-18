class UserStory < ActiveRecord::Base
  attr_accessible :liked, :read, :stared, :story_id, :user_id, :feed_id, :subscription_id

  belongs_to :user
  belongs_to :story
  belongs_to :feed
  belongs_to :subscription

  def like
    self.liked = true
  end

  def unlike
    self.liked = false
  end

  def mark_as_read
    self.read = true
  end

  def mark_as_unread
    self.read = false
  end

  def star
    self.stared = true
  end

  def unstar
    self.stared = false
  end
end
