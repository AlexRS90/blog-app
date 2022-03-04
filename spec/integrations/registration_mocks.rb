require 'user'

module Mocks
  def create_users
    names = [
      { name: 'Mateo', bio: "I'm the last oracle", post_counter: 5, email: 'foo1@foo.com', role: 'admin' },
      { name: 'Felipe', bio: "I'm the First oracle", post_counter: 5, email: 'foo2@foo.com', role: 'admin' }
    ]
    (0..1).each do |i|
      user = User.new(names[i])
      user.password = 'admin123'
      user.password_confirmation = 'admin123'
      user.skip_confirmation!
      user.save!
    end
    User.all
  end

  def create_posts(users)
    users.each do |user|
      (1..5).each do |j|
        Post.create(title: "Post number: #{j}", text: "This is post number: #{j}", comments_counter: 0,
                    likes_counter: 0, user_id: user.id)
      end
    end
    Post.all
  end

  def create_likes_comments(users, posts)
    posts.each do |post|
      (0..1).each do |j|
        Like.create(user_id: users[j].id, post_id: post.id)
        Comment.create(user_id: users[j].id, post_id: post.id,
                       text: "I'm #{users[j].name} and I'm commenting gibberish here.")
      end
    end
    [Like.all, Comment.all]
  end
end