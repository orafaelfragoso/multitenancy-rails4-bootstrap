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

end
