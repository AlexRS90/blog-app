class UsersController < ApplicationController
  def index
    @users = User.all.order(id: :asc)
  end

  def show
    @user_id = User.find_by(id: params[:id])
    @post = User.recent_posts(@user_id)
  end
end
