class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    user = User.find(params[:user_id])
    new_like = Like.create(user_id: user.id, post_id: post.id)

    if new_like.save
      flash[:success] = 'Liked'
    else
      flash[:error] = 'Not liked!'
    end
    redirect_to "/users/#{user.id}/posts/#{post.id}"
  end
end
