require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create!(name: 'Alex', photo: 'htt:/www.photo.com', bio: 'Full Stack', post_counter: 5) }
  let(:post) do
    Post.create!(user: user, title: 'This is a Test', text: 'Content', comments_counter: 5, likes_counter: 5)
  end

  subject do
    Comment.new(user_id: 1, post_id: 3, text: 'Happy Coding')
  end

  before { subject.save }

  it 'Text should have text' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'update comment counter for post' do
    post.comments.create(user: user)
    expect(post.comments_counter).to eq(5)
  end
end
