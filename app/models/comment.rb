class Comment < ActiveRecord::Base
  attr_accessible :content, :shared_story_id, :user_id

  belogs_to :user
  belongs_to :shared_story
end
