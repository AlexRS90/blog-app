class PostsController < ApplicationController
  def index
    user_url = params[:user_id]
    @users = User.find_by(id: user_url)
    @post = Post.where(user_id: user_url)
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @post = Post.find(params[:id])
  end
end
