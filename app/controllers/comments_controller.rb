class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = params[:post_id]
    @user = params[:user_id]
  end

  def create
    users = User.find_by(id: params[:user_id])
    post = Post.find(params[:post_id])
    @new_comment = Comment.create(user_id: users.id, post_id: post.id, text: comment_params[:text])
    if @new_comment.save
      flash[:success] = 'New comment created successfully! =D'
      redirect_to "/users/#{users.id}/posts/#{post.id}"
    else
      flash[:error] = @new_comment.errors.full_messages[0]
      redirect_to "/users/#{users.id}/posts/#{post.id}/comments/new"
    end
  end

  def destroy
    @post = Post.find_by_id(params[:post_id])
    @user = User.find_by_id(params[:user_id])
    @comment = @post.comments.find(params[:format])
    if @comment.destroy
      flash[:success] = 'Comment destroyed successfully'
    else
      flash[:error] = 'Error:  Comment could not be destroyed'
    end
    redirect_to "/users/#{@user.id}/posts"
  end

  private

  def comment_params
    params.require(:data).permit(:text)
  end
end
