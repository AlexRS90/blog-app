class User < ApplicationRecord
  validates :name, presence: { message: "Your name can't be empty." }
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.recent_posts(user_num)
    Post.where(user_id: user_num).order(created_at: :asc).limit(3)
  end
end
