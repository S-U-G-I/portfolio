class CommentsController < ApplicationController
  def create
  @tweet = Tweet.find(params[:tweet_id])
  @comment = @tweet.comments.build(comment_params)
  @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: tweet_path(@tweet.id))
    else
      flash[:danger] = "コメントできません"
      redirect_back(fallback_location: tweet_path(@tweet.id))
    end 
  end

  def destroy
    @tweet=Tweet.find_by(id: params[:tweet_id])
    @comment=Comment.find_by(id: params[:tweet_id])
    @comment.destroy
    flash[:notice] = "削除しました"
    redirect_to controller: "tweets", action: "show"
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :tweet_id, :user_id)
  end
end
