class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @tweets = Tweet.all.order(id: :desc).page(params[:page]).per(9)
  end

  def show
    begin
      @tweet = Tweet.find(params[:id])
      @comments = @tweet.comments
      @comment = Comment.new
    rescue
      flash[:danger] = "ツイートが見つかりません"
    end  
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweets = Tweet.new
    @tweet = current_user.tweets.new(tweet_params)
    begin
      @tweet.save!
      flash[:notice] = "投稿しました"
      redirect_to root_path
    rescue
      render :new
    end
  end

  def destroy
    @tweet=Tweet.find(params[:id])
    @tweet.destroy
    flash[:notice] = "削除しました"
    redirect_to root_path
  end

  private
  def tweet_params
    params.require(:tweet).permit(:img, :tweet)
  end
end
