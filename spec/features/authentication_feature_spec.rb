require 'rails_helper'

describe 'user authentication' do

  it 'allows user sign in with valid credentials' do
    user_sign_in(create(:user))
    expect(page).to have_content('Signed in successfully')
  end

  it 'does not allow user sign in with invalid credentials' do
    user_sign_in(build(:user, password: 'wrongpass'))
    expect(page).to have_content('Invalid email or password')
  end

  it 'does not allow user sign in unless on subdomain' do
  end

  it 'allows user to sign out' do
    user_sign_in(create(:user))
    click_link 'Sign out'
    expect(page).to have_content('Signed out successfully')
  end

end
