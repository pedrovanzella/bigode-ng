class Story < ActiveRecord::Base
  attr_accessible :author, :content, :published, :summary, :title, :url

  belongs_to :feed

  has_many :user_stories
  has_many :users, :through => :user_stories # So we can list who liked et al
end
