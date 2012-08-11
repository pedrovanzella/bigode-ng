class UserStory < ActiveRecord::Base
  attr_accessible :liked, :read, :stared, :story_id, :user_id

  belongs_to :user
  belongs_to :story
end
