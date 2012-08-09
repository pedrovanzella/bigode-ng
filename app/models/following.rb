class Following < ActiveRecord::Base
  attr_accessible :user_id, :follower_id
  
  belongs_to :user
  belongs_to :follower, :class_name => "User"
end
