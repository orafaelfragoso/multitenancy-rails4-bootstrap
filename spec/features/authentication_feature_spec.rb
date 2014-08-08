require 'rails_helper'

describe 'user authentication' do

  let(:user) { build(:user) }
  let!(:account) { create(:account_with_schema, owner: user) }

  it 'allows user sign in with valid credentials' do
    user_sign_in(user, subdomain: account.subdomain)
    expect(page).to have_content('Signed in successfully')
  end

  it 'does not allow user sign in with invalid credentials' do
    user_sign_in(user, subdomain: account.subdomain, password: 'something wrong')
    expect(page).to have_content('Invalid email or password')
  end

  it 'does not allow user sign in unless on subdomain' do
    expect { visit new_user_session_url(subdomain: nil) }.to raise_error ActionController::RoutingError
  end

  it 'does not allow user from one subdomain to sign in on another subdomain' do
    user2 = build(:user)
    account2 = create(:account_with_schema, owner: user2)

    user_sign_in(user2, subdomain: account2.subdomain)
    expect(page).to have_content('Signed in successfully')

    user_sign_in(user2, subdomain: account.subdomain)
    expect(page).to have_content('Invalid email or password')
  end

  it 'allows user to sign out' do
    user_sign_in(user, subdomain: account.subdomain)
    click_link 'Sign out'
    expect(page).to have_content('Signed out successfully')
  end

end
