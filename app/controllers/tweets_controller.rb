class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    @tweet.save
    redirect_to root_path
  end

  private
  def tweet_params
    params.require(:tweet).permit(:img, :tweet)
  end
end
