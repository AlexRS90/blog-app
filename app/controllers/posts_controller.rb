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

  def new
    @post = Post.new
    @users = User.find_by(id: params[:user_id])
  end

  def create
    @users = User.find_by(id: params[:user_id])
    @post = Post.new(user_id: @users.id, title: params[:post][:title], text: params[:post][:text], comments_counter: 0,
                     likes_counter: 0)
    if @post.save
      flash[:success] = 'New post created successfully!'
      redirect_to "/users/#{@users.id}/posts"
    else
      flash[:error] = @post.errors.full_messages[0]
      redirect_to "/users/#{@users.id}/posts/new"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
