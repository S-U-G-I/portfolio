class UsersController < ApplicationController
  def index
    @users = User.all.order(id: :desc).page(params[:page]).per(12)
  end

  def show
    begin
    @user = User.find(params[:id])
    @tweet = @user.tweets.order(id: :desc).page(params[:page]).per(9)
    rescue
      flash[:danger] = "ユーザーが見つかりません"
      redirect_to root_path
    end
    
  end

  def following
    #@userがフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.following.order(id: :desc).page(params[:page]).per(12)
  end

  def followers
    #@userをフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.followers.order(id: :desc).page(params[:page]).per(12)
  end
  
end
