require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create!(name: 'Alex', photo: 'htt:/www.photo.com', bio: 'Full Stack', post_counter: 3) }

  subject do
    Post.create(user: user, title: 'My Post', text: 'This is my first post', comments_counter: 3, likes_counter: 3)
  end

  before { subject.save }

  it 'Title must be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Title must have at least 5 characters and less than 251' do
    subject.title = 'My Post'
    expect(subject.title.length).to be_between(5, 250)
  end

  it 'Comment counter should be bigger or equal than zero' do
    subject.comments_counter = 2
    expect(subject.comments_counter).to be >= 0
  end

  it 'Like counter should be bigger or equal than zero' do
    subject.likes_counter = 2
    expect(subject.likes_counter).to be >= 0
  end

  it 'recent comments should return the last 5 comments' do
    subject.comments.create!(post: subject, user: user, text: 'comment no 1')
    subject.comments.create!(post: subject, user: user, text: 'comment no 2')
    subject.comments.create!(post: subject, user: user, text: 'comment no 3')
    subject.comments.create!(post: subject, user: user, text: 'comment no 4')
    subject.comments.create!(post: subject, user: user, text: 'comment no 5')
    subject.comments.create!(post: subject, user: user, text: 'comment no 6')
    subject.comments.create!(post: subject, user: user, text: 'comment no 7')
    expect(subject.recent_comments.length).to be(5)
  end
end
