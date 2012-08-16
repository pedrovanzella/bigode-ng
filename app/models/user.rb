class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  attr_accessor :login
  
  validates :username, presence: true, uniqueness: true

  # Following and followers
  has_many :followeds, :class_name => "Following",
                       :foreign_key => "follower_id"
  has_many :follows, :through => :followeds,
                     :source => :user

  has_many :followings
  has_many :followers, :through => :followings

  has_many :subscriptions
  has_many :feeds, :through => :subscriptions

  # We need to relate the user model to the story model somehow, in order to keep read, stared and liked status
  has_many :user_stories
  has_many :stories, :through => :user_stories

  # User shares stories and his friends see them
  has_many :shared_stories

  # User can comment on shared stories (his own or his friends)
  has_many :comments

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def subscribe(feed)
    self.feeds << feed
  end
  
  def subscribe_url(url)
    feed = Feed.find_by_feed_url(url) || Feed.create(feed_url: url)
    self.subscribe feed unless self.feeds.include? feed
  end

  def unsubscribe(feed)
    self.feeds.delete(feed)
  end

end
