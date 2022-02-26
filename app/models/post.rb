class Post < ApplicationRecord
  validates :title, presence:  { message: 'We need a title to display your post =D' },
                    length: { maximum: 250, minimum: 5, message: 'Your title must be between 5 and 250 letters =D' }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0, message: 'Empty data is not valid.' }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0, message: 'Empty data is not valid.' }

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  after_save :update_posts_counter

  def recent_comments
    comments.order(created_at: :asc).limit(5)
  end

  private

  def update_posts_counter
    user.update(post_counter: user.posts.length)
  end
end
