def user_sign_in(user, opts={})
  visit new_user_session_url(subdomain: nil)
  fill_in 'Email', with: user.email
  fill_in 'Password', with: (opts[:password] || user.password)
  click_button 'Sign in'
end
