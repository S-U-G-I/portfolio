class UsersController < ApplicationController

  def index
    @users = User.all.order(id: :desc)
  end

  def show
    @user = User.find(params[:id])
  end

  def following
    #@userがフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.following
  end

  def followers
    #@userをフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.followers
  end
  
end
