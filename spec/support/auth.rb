def user_sign_in(user, opts={})
  visit new_user_session_url(subdomain: (opts[:subdomain] || nil))
  fill_in 'Email', with: user.email
  fill_in 'Password', with: (opts[:password] || user.password)
  click_button 'Sign in'
end

def user_sign_up(subdomain)
  visit root_url(subdomain: nil)
  click_link 'Create Your Account'

  fill_in 'account_company_name', with: Faker::Company.name
  fill_in 'account_subdomain', with: subdomain
  fill_in 'Email', with: Faker::Internet.email
  fill_in 'Password', with: '12345678'
  fill_in 'Password confirmation', with: '12345678'

  click_button 'Create Account'
end
