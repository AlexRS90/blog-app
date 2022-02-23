class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.recent_posts(user_num)
    Post.where(user_id: user_num).order(created_at: :asc).limit(3)
  end
end
