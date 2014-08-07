require 'rails_helper'

describe 'account creation' do
  let(:account) { build(:account) }

  it 'allows user to create an account' do
    visit root_path
    click_link 'Create Your Account'

    fill_in 'account_company_name', with: account.company_name
    fill_in 'account_subdomain', with: account.subdomain
    fill_in 'Email', with: Faker::Internet.email
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'

    click_button 'Create Account'
    expect(page).to have_content('Signed up successfully!')
  end

end
