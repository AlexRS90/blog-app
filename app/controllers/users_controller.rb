class UsersController < ApplicationController
  def index
    @users = User.all.order(id: :asc)
  end

  def show
    @users = User.find_by(id: params[:id])
    @post = User.recent_posts(@users)
  end
end
