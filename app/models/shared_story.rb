class SharedStory < ActiveRecord::Base
  attr_accessible :note, :story_id, :user_id
end
