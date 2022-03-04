require 'rails_helper'
require './spec/integrations/registration_mocks'

RSpec.describe 'Post show view', type: :feature do
  include Mocks
  before :each do
    @users = create_users
    @posts = create_posts(@users)
    @likes, @comments = create_likes_comments(@users, @posts)
    visit new_user_session_path  
    within('form') do
      fill_in 'user_email', with: 'foo1@foo.com'
      fill_in 'user_password', with: 'admin123'
    end
    click_button 'Log in'
    click_link('Profile', match: :first)
    click_link('See all posts')
    click_link('Comments', match: :first)
  end

  context 'Elements on page show' do
    it 'Should display User\'s name' do
      expect(page).to have_content(@users.first.name)
    end

    it 'Should display Post\'s title' do
      post = Post.where(user_id: 1).first
      expect(page).to have_content('Post number: 2')
    end

    it 'Should display Post\'s title' do
      post = Post.where(user_id: 1).first
      expect(page).to have_content('This is post number: 2')
    end

    it 'How many comments a post has' do
      expect(page).to have_content('Comments: 2')
    end
  
    it 'How many likes a post has' do
      expect(page).to have_content('Likes: 2')
    end

    it 'I can see the username of each commentor' do
      expect(page).to have_content("#{@users.first.name}:")
    end

    it 'I can see the comment each commentor left.' do
      expect(page).to have_content("I'm Mateo and I'm commenting gibberish here.")
    end

  end
end