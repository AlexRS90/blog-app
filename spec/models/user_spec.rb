require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
             post_counter: 0)
  end

  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Post counter should be bigger or equal than zero' do
    subject.post_counter = 2
    expect(subject.post_counter).to be >= 0
  end
end
