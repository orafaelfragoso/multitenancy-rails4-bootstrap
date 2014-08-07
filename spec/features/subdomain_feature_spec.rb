require 'rails_helper'

describe 'subdomains' do
  let!(:account) { create(:account_with_schema) }

  it 'redirects invalid accounts' do
    expect{ visit root_url(subdomain: 'invalid-domain') }.to raise_error ActionController::RoutingError
  end

  it 'allows valid accounts' do
    visit root_url(subdomain: account.subdomain)
    expect(page.current_url).to include(account.subdomain)
  end

  it 'forces user to login before access subdomain' do
    visit root_url(subdomain: account.subdomain)
    expect(page).to have_content('You need to sign in or sign up before continuing')
  end

end
