require 'rails_helper'
RSpec.feature "Users", type: :feature do
  context 'Log in' do
    scenario 'Should have title' do
      visit new_user_session_path
      expect(page).to have_content('Log in')
    end

    scenario 'Should have email, password and submit button' do
      visit new_user_session_path
      find('#user_email')
      find('#user_password')
      click_button 'Log in'
      expect(page).to be_present
    end
  end
end