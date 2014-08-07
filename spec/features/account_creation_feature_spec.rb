require 'rails_helper'

describe 'account creation' do
  let(:account) { build(:account) }
  let(:subdomain) { FactoryGirl.generate(:subdomain) }
  before(:each) { user_sign_up(subdomain) }

  it 'allows user to create an account' do
    expect(page.current_url).to include(subdomain)
    expect(Account.all.count).to eq(1)
  end

  it 'allows access of subdomain' do
    visit root_url(subdomain: subdomain)
    expect(page.current_url).to include(subdomain)
  end

  it 'allows account followup creation' do
    subdomain2 = "#{subdomain}2"
    user_sign_up(subdomain2)
    expect(page.current_url).to include(subdomain2)
    expect(Account.all.count).to eq(2)
  end

  it 'does not allow account creation on subdomain' do
    user = User.first
    subdomain = Account.first.subdomain
    user_sign_in(user, subdomain: subdomain)
    expect { visit new_account_url(subdomain: subdomain) }.to raise_error ActionController::RoutingError
  end

end
