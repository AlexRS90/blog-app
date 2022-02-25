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
  end

  def create
    @users = User.find_by(id: :user_id)
    @post = Post.new(user_id: @users, title: params[:post][:title], text: params[:post][:text])
    if @post.save
      flash[:success] = 'New post created successfully!'
      redirect_to users_path
    else
      flash.now[:error] = 'Error: Data was not saved!'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
