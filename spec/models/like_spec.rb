require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create!(name: 'Alex', photo: 'htt:/www.photo.com', bio: 'Full Stack', post_counter: 0) }
  let(:post) { Post.create!(user: user, title: 'This is a test', text: 'RSPEC', comments_counter: 0, likes_counter: 0) }

  it 'Should update likes counter for post' do
    post.likes.create(user: user)
    expect(post.likes_counter).to be(1)
  end
end
