require 'rails_helper'

feature 'Sign Up' do
  background :each do
    visit new_user_path
  end

  it 'has a user sign up page' do
    expect(page).to have_content('Sign Up')
  end

  it 'takes a username and password' do
    expect(page).to have_content('Username')
    expect(page).to have_content('Password')
    # expect(page).to have_content('Email')
    # expect(page).to have_content('Age')
  end

  it 'redirect to user\'s show and displays username on success' do
    fill_in 'Username', with: 'harry_potter'
    fill_in 'Password', with: 'abcdef'
    # fill_in 'Email', with: 'harry@hogwarts.com'
    # fill_in 'Age', with: '25'
    # Demo save_and_open_page
    click_button 'Create User'
    # Demo save_and_open_page
    expect(page).to have_content('harry_potter')
    user = User.find_by(username: 'harry_potter')
    expect(current_path).to eq(user_path(user))
  end
end