class Subscription < ActiveRecord::Base
  attr_accessible :feed_id, :user_id

  belongs_to :user
  belongs_to :feed

  has_many :user_stories
  has_many :stories, :through => :user_stories

  # Get all new :stories from :feed and create a new :user_story for each
  # TODO: Getting every story from the feed is pretty inefficient
  def sync
    self.feed.stories.each do |story|
      unless self.user_stories.find_by_story_id(story)
        self.user_stories << UserStory.create(feed_id: self.feed.id,
                                              story_id: story.id,
                                              user_id: self.user.id,
                                              subscription_id: self.id,
                                              read: false,
                                              liked: false)
      end
    end
  end
end
