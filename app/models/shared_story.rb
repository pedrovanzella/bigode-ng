class SharedStory < ActiveRecord::Base
  attr_accessible :note, :story_id, :user_id

  belongs_to :user
  belongs_to :story

  has_many :comments
end
