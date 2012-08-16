class SubscriptionsController < ApplicationController

  before_filter :authenticate_user!

  def create
    current_user.subscribe_url(params[:feed][:feed_url])
   redirect_to :back
  end

  def index
    @feeds = current_user.feeds
  end

  def show
    @feed = Feed.find(params[:id])
    @subscription = Subscription.find_by_user_id_and_feed_id(current_user, @feed)
    @subscription.sync
    @stories = @subscription.stories
  end

  def destroy
    feed = Feed.find(params[:id])
    current_user.unsubscribe(feed)
  end
end
